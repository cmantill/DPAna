#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <vector>
#include <unistd.h>
#include <string>       // std::string
#include <iostream>     // std::cout
#include <sstream>
#include <iomanip>
#include <fstream>


using namespace std;

#include <gsl/gsl_rng.h>
#include <gsl/gsl_randist.h>

#include <TSpline.h>
#include <TMath.h>
#include <TFile.h>
#include <TTree.h>

#include "HepMC/GenEvent.h"
#include "HepMC/GenParticle.h"
#include "HepMC/GenVertex.h"
#include "HepMC/IO_AsciiParticles.h"
//#include "HepMC/WriterRootTree.h"
#include "HepMC/IO_GenEvent.h"

using namespace HepMC;


struct stdhep_entry {
    int isthep;     /* status code */
    int idhep;      /* The particle id */
    int jmohep[2];    /* The position of the mother particle */
    double phep[5];    /* 4-Momentum, mass */
    //double spinlh[3];
    //    //double icolorflowlh[2];
};

struct stdhep_event {
    stdhep_entry *aprime;
    stdhep_entry *postrack;
    stdhep_entry *negtrack;
};

// decay width calculations follow arXiv:1311.3870, Eq. 27 and 28
// all decay widths must be multiplied by epsilon^2
// decay width of A'->e+e- in units of GeV
double width_dielectron(double m_aprime) {
    double alpha = 1.0/137.036;
    double m_electron = 5.11e-3;
    double massratio_sq = m_electron*m_electron/(m_aprime*m_aprime);
    if (m_aprime>2*m_electron)
        return (alpha*m_aprime/3.0) * sqrt(1 - 4*massratio_sq) * (1 + 2*massratio_sq);
    else return 0.0;
}

// decay width of A'->mu+mu- in units of GeV
double width_dimuon(double m_aprime) {
    double alpha = 1.0/137.036;
    double m_muon = 105.66e-3;
    double massratio_sq = m_muon*m_muon/(m_aprime*m_aprime);
    if (m_aprime>2*m_muon)
        return (alpha*m_aprime/3.0) * sqrt(1 - 4*massratio_sq) * (1 + 2*massratio_sq);
    else return 0.0;
}

// decay width of A'->hadrons in units of GeV
double width_dihadron(TSpline * r_spline, double m_aprime) {
    double alpha = 1.0/137.036;
    double m_pion = 139.57e-3;
    if (m_aprime>2*m_pion)
        return (alpha*m_aprime/3.0) * r_spline->Eval(m_aprime);
    else return 0.0;
}

// total decay width in units of GeV
double width_total(TSpline * r_spline, double m_aprime) {
    return width_dielectron(m_aprime)+width_dimuon(m_aprime)+width_dihadron(r_spline,m_aprime);
}

// mean lifetime in units of cm
// must be divided by epsilon^2
double get_ctau(TSpline * r_spline, double m_aprime) {
    //1e9*elementary charge = conversion factor from GeV to joules
    return TMath::Ccgs()*TMath::Hbar()/(1e9*TMath::Qe()*width_total(r_spline,m_aprime));
}

// branching fraction to dimuon
double branching_dimuon(TSpline * r_spline, double m_aprime) {
    return width_dimuon(m_aprime)/width_total(r_spline,m_aprime);
}

// takes input stdhep file, applies beam rotation and width, and writes to a new stdhep file
int main(int argc,char** argv)
{
    int nevhep;             /* The event number */

    int rseed = 0;

    //double decay_length = -1.0;
    double eps = 1e-6;

    int n_repeat = 100; //number of times to sample the decay distribution for each input event
    double vx_production[3] = {0.0, 2.0, 50.0};//beamspot at y=2 cm; guess z=50 cm for mean interaction position (dump face at 25 cm, interaction length 16.77 cm)
    double min_vz = 300.0;
    double max_vz = 800.0;

    double fmag_maxkick = 2.9; //GeV/c
    double fmag_minz = 0.0;
    double fmag_maxz = 500.0;
    double kmag_maxkick = 0.414; //GeV/c
    //center of KMag is at z=1041.8
    double kmag_minz = 891.8;
    double kmag_maxz = 1191.8;

    Double_t mass = -1.0;
    double ctau = 0.0;

    bool cut_on_acceptance_tracking = false;
    bool cut_on_acceptance_trigger = false;
    bool write_tree = true;

    int c;

    while ((c = getopt(argc,argv,"hs:n:e:E:m:z:Z:cCw")) !=-1)
        switch (c)
        {
            case 'h':
                printf("-h: print this help\n");
                printf("-s: RNG seed\n");
                printf("-l: A' decay length in mm\n");
                return(0);
                break;
            case 's':
                rseed = atoi(optarg);
                break;
            case 'n':
                n_repeat = atoi(optarg);
                break;
            case 'e':
                eps = atof(optarg);
                break;
            case 'E':
                eps = pow(10.0,atof(optarg));
                break;
            case 'm':
                mass = atof(optarg);
                break;
            case 'z':
                min_vz = atof(optarg);
                break;
            case 'Z':
                max_vz = atof(optarg);
                break;
            case 'c':
                cut_on_acceptance_tracking = true;
                break;
            case 'C':
                cut_on_acceptance_trigger = true;
                break;
            case 'w':
                write_tree = true;
                break;
            case '?':
                printf("Invalid option or missing option argument; -h to list options\n");
                return(1);
            default:
                abort();
        }

    if ( argc-optind < 2 )
    {
        printf("<input stdhep filename> <output stdhep filename>\n");
        return 1;
    }

    double e_cm[2000], r_ratio[2000];
    int n_rpoints = 0;
    FILE * r_file;
    r_file = fopen("rpp2017-hadronicrpp_page1001.dat","r");
    char line[1000];
    int numvals;
    while (fgets(line,1000,r_file)!=NULL) {
        numvals = sscanf(line," %lf %*f %*f %lf",&e_cm[n_rpoints], &r_ratio[n_rpoints]);
        if (numvals==2 && e_cm[n_rpoints]>e_cm[n_rpoints-1] && e_cm[n_rpoints]<10.0) { //reject repeated points with the same E, and only go up to 10 GeV
            //printf("%f %f\n",e_cm[n_rpoints],r_ratio[n_rpoints]);
            n_rpoints++;
        }
    }
    printf("loaded R data with %d points\n",n_rpoints);
    fclose(r_file);
    TSpline3 * r_spline = new TSpline3("R_ratio", e_cm, r_ratio, n_rpoints, "", 0.0, r_ratio[n_rpoints-1]);
    r_spline->SetName("R_ratio");

    if (mass>0) {
        ctau = get_ctau(r_spline,mass)/(eps*eps);
        printf("mass=%f GeV, epsilon=%e, ctau=%f cm\n",mass, eps, ctau);
    }

    FILE * in_file;

    in_file = fopen(argv[optind],"r");

    //initialize the RNG
    const gsl_rng_type * T;
    gsl_rng * r;
    gsl_rng_env_setup();

    T = gsl_rng_mt19937;
    r = gsl_rng_alloc (T);
    gsl_rng_set(r,rseed);

    int ostream = 0;

    TFile* saveFile = new TFile(argv[optind+1], "recreate");
    TTree* save;
    if (write_tree)
        save = new TTree("save", "save");
    //saveFile->cd();


    Double_t vx[3];
    Double_t px0, py0, pz0;
    Double_t pz1, y1, ty1, x1_st1, tx1_st1, x1, tx1;
    Double_t pz2, y2, ty2, x2_st1, tx2_st1, x2, tx2;
    if (write_tree) {
        save->Branch("vx",&vx[0],"vx/D");
        save->Branch("vy",&vx[1],"vy/D");
        save->Branch("vz",&vx[2],"vz/D");
        save->Branch("mass",&mass,"mass/D");
        save->Branch("px0",&px0,"px0/D");
        save->Branch("py0",&py0,"py0/D");
        save->Branch("pz0",&pz0,"pz0/D");

        save->Branch("pz1",&pz1,"pz1/D");
        save->Branch("y1",&y1,"y1/D");
        save->Branch("ty1",&ty1,"ty1/D");
        save->Branch("x1_st1",&x1_st1,"x1_st1/D");
        save->Branch("tx1_st1",&tx1_st1,"tx1_st1/D");
        save->Branch("x1",&x1,"x1/D");
        save->Branch("tx1",&tx1,"tx1/D");

        save->Branch("pz2",&pz2,"pz2/D");
        save->Branch("y2",&y2,"y2/D");
        save->Branch("ty2",&ty2,"ty2/D");
        save->Branch("x2_st1",&x2_st1,"x2_st1/D");
        save->Branch("tx2_st1",&tx2_st1,"tx2_st1/D");
        save->Branch("x2",&x2,"x2/D");
        save->Branch("tx2",&tx2,"tx2/D");
    }

    vector<stdhep_event> input_events;

    nevhep = 1;
    int n_accepted_events = 0;
    
    while (true) {

      
        char line[1000];
        bool found_event = false;
	
        while (fgets(line,1000,in_file)!=NULL) {
	  
            if (strstr(line,"<event")!=NULL) {
	     
                found_event = true;
                break;
            }
        }
        if (!found_event) {
	  
            fclose(in_file);
            break;
        }

        int nup, idprup; //number of particles, process ID
        double xwgtup; //event weight
	
        struct stdhep_event temp_event = (struct stdhep_event) {0,0,0};
        while (true) {
            struct stdhep_entry *temp = new struct stdhep_entry;
            fgets(line,1000,in_file);
            char blah[1000];
            int n_tokens = sscanf(line,"%d %d %d %*d %lf %lf %lf %lf %lf",&(temp->idhep),&(temp->isthep),&(temp->jmohep[0]),&(temp->phep[3]),&(temp->phep[0]),&(temp->phep[1]),&(temp->phep[2]),&(temp->phep[4]));
            if (n_tokens<8) break;
            switch (temp->isthep) {//translate between status conventions for HEPEUP (LHE) and HEPEVT (StdHep)
                case 1:
                case 2:
                    break;
                case -1:
                    temp->isthep = 3;
                    break;
                default:
                    temp->isthep = 0;
            }
            if (temp->isthep==2 && temp->idhep==666) {// intermediate particle, PDG ID 666
                if (temp_event.aprime) printf("WARNING: multiple A'\n");
                temp_event.aprime = temp;
                if (mass<0) { //only read mass on the first event (assume all events in a file have the same mass)
                    mass = temp->phep[4];
                    ctau = get_ctau(r_spline,mass)/(eps*eps);
                    printf("mass=%f GeV, epsilon=%e, ctau=%f cm\n",mass, eps, ctau);
                }
            }
            else if (temp->isthep==3 && temp->idhep==13) {// final state particle. mu-
                if (temp_event.negtrack) printf("WARNING: multiple mu-\n");
                temp_event.negtrack = temp;
            }
            else if (temp->isthep==3 && temp->idhep==-13) {// final state particle, mu+
                if (temp_event.postrack) printf("WARNING: multiple mu+\n");
                temp_event.postrack = temp;
            }
            else delete temp;
            //new_event.particles.push_back(*temp);
        }
        if (temp_event.aprime && temp_event.negtrack && temp_event.postrack) {
            input_events.push_back(temp_event);
        }
        else printf("WARNING: missing A', mu-, or mu+\n");
        if (nevhep%1000==0) printf("%d\n",nevhep);
        nevhep++;
    }
    //printf("Aprime %d %f %f %f %f %f\n",aprime->idhep,aprime->phep[0],aprime->phep[1],aprime->phep[2],aprime->phep[3],aprime->phep[4]);
    //printf("negtrack %d %f %f %f %f %f\n",negtrack->idhep,negtrack->phep[0],negtrack->phep[1],negtrack->phep[2],negtrack->phep[3],negtrack->phep[4]);
    //printf("postrack %d %f %f %f %f %f\n",postrack->idhep,postrack->phep[0],postrack->phep[1],postrack->phep[2],postrack->phep[3],postrack->phep[4]);

    // writing HepMC file
    //shared_ptr<GenRunInfo> runinfo = make_shared<GenRunInfo>();
    IO_GenEvent IO_GenEvent("output.dat");
    ofstream outputFile("graphData.txt");
    //outputFile.open("graphData.txt",fstream::app);
    int n_extra_repeats = 0;
    do {
        for (vector<stdhep_event>::iterator event = input_events.begin(); event!=input_events.end();++event) {
            double gamma, beta;
            gamma = event->aprime->phep[3]/event->aprime->phep[4];
            beta = sqrt(1.0-pow(gamma,-2.0));
            double decay_length = beta*gamma*ctau;
            double p = 0.0;
            for (int j=0;j<3;j++) p += event->aprime->phep[j]*event->aprime->phep[j];
            p = sqrt(p);

            px0 = event->aprime->phep[0];
            py0 = event->aprime->phep[1];
            pz0 = event->aprime->phep[2];

            double px1 = event->postrack->phep[0];
            double py1 = event->postrack->phep[1];
            double pz1 = event->postrack->phep[2];
            double pt1 = event->postrack->phep[3];

            double px2 = event->negtrack->phep[0];
            double py2 = event->negtrack->phep[1];
            double pz2 = event->negtrack->phep[2];
            double pt2 = event->negtrack->phep[3];


            for (int i=0;i<n_repeat;i++) {
                double vtx_displacement = gsl_ran_exponential(r,decay_length);

                double vx[3]; //vertex position
                for (int j=0;j<3;j++) vx[j] = vtx_displacement*event->aprime->phep[j]/p + vx_production[j];
                if (vx[2]<min_vz || vx[2]>max_vz) continue;

		double fmag_kick, kmag_kick;
                double fmag_center, kmag_center;
                if (vx[2]>fmag_maxz) {
		  fmag_kick = 0.0;
		  fmag_center = 0.0;
                } else if (vx[2]>fmag_minz) {
		  fmag_kick = fmag_maxkick*(fmag_maxz-vx[2])/(fmag_maxz-fmag_minz);
		  fmag_center = (fmag_maxz+vx[2])/2.0;
                } else {
		  fmag_kick = fmag_maxkick;
		  fmag_center = (fmag_maxz+fmag_minz)/2.0;
                }

                if (vx[2]>kmag_maxz) {
		  kmag_kick = 0.0;
		  kmag_center = 0.0;
                } else if (vx[2]>kmag_minz) {
		  kmag_kick = kmag_maxkick*(kmag_maxz-vx[2])/(kmag_maxz-kmag_minz);
		  kmag_center = (kmag_maxz+vx[2])/2.0;
                } else {
		  kmag_kick = kmag_maxkick;
		  kmag_center = (kmag_maxz+kmag_minz)/2.0;
                }

                // positive track
                pz1 = event->postrack->phep[2];
                ty1 = event->postrack->phep[1]/event->postrack->phep[2];  // y/z angle = py/pz
                tx1_st1 = (event->postrack->phep[0]+fmag_kick)/event->postrack->phep[2]; // x/z angle = px+kmag/pz
                tx1 = (event->postrack->phep[0]+fmag_kick+kmag_kick)/event->postrack->phep[2]; // x/z angle = px+fmag+kmag/pz
                y1 = vx[1] - vx[2]*ty1;//extrapolate to z=0
                //double tx1_dump = postrack->phep[0]/postrack->phep[2];
                //double x1_fmag = vx[0] + (fmag_center-vx[2])*tx1_dump;
                x1_st1 = vx[0] + (fmag_center-vx[2])*(event->postrack->phep[0]/event->postrack->phep[2]) - fmag_center*tx1_st1;
                //double x1_kmag = x1_st1 + kmag_center*tx1_st1;
                x1 = vx[0] + x1_st1 + kmag_center*tx1_st1 - kmag_center*tx1;

                // negative track
                pz2 = event->negtrack->phep[2];
                ty2 = event->negtrack->phep[1]/event->negtrack->phep[2];
                tx2_st1 = (event->negtrack->phep[0]-fmag_kick)/event->negtrack->phep[2];
                tx2 = (event->negtrack->phep[0]-fmag_kick-kmag_kick)/event->negtrack->phep[2];
                //ty2 = negtrack->phep[1]/negtrack->phep[2];
                y2 = vx[1] - vx[2]*ty2;//extrapolate to z=0
                //double tx2_dump = negtrack->phep[0]/negtrack->phep[2];
                //double x2_fmag = vx[0] + (fmag_center-vx[2])/tx1_dump;
                x2_st1 = vx[0] + (fmag_center-vx[2])*(event->negtrack->phep[0]/event->negtrack->phep[2]) - fmag_center*tx2_st1;
                //double x2_kmag = x1_st1 + kmag_center*tx1_st1;
                x2 = vx[0] + x2_st1 + kmag_center*tx2_st1 - kmag_center*tx2;

                n_accepted_events++;
                if (write_tree)
		  save->Fill();

                // create HepMC evt
                GenEvent* evt = new GenEvent(Units::GEV, Units::CM);
                evt->set_event_number(n_accepted_events);
                // create A' particle
                GenParticle* paprime = new GenParticle( FourVector(px0,py0,pz0,event->aprime->phep[3]), event->aprime->idhep, event->aprime->isthep);
                // create postrack particle
                GenParticle* ppostrack = new GenParticle( FourVector(0, 0, 20, 20), event->postrack->idhep, event->postrack->isthep);
                ppostrack->set_status(1);
                // create negtrack particle
                GenParticle* pnegtrack = new GenParticle( FourVector(px2, py2, pz2, pt2), event->negtrack->idhep, event->negtrack->isthep);
                pnegtrack->set_status(1);
                // create A' vertex
                // need to know where the vertex is (vx)
                vx[3] = sqrt( 500*500 + event->aprime->phep[4]*event->aprime->phep[4]);
                GenVertex* vaprime = new GenVertex( FourVector(0, 0, 500, 500) );
                evt->add_vertex( vaprime );
                vaprime->add_particle_in( paprime );
                vaprime->add_particle_out( ppostrack );
                //vaprime->add_particle_out( pnegtrack );
                IO_GenEvent.write_event(evt);
  
            }
        }
        n_extra_repeats++;
    } while (n_accepted_events>0 && n_accepted_events<10);//if we get any events, run until we have 10 good events
    printf("%d events accepted by cuts after %dx%d samples of %d events\n",n_accepted_events,n_repeat,n_extra_repeats,input_events.size());
    //IO_GenEvent.close();

    save->Write();
    outputFile.close();
    saveFile->Write();
    saveFile->Close();

    //ReaderAscii input("output.dat");
    //WriterRootTree  root_output("output.root");
    //int events_parsed = 0;
    //while( !text_input.failed() ) {
    //GenEvent evt(Units::GEV,Units::MM);
    //text_input.read_event(evt);
    //if( text_input.failed() ) break;
    //if( events_parsed == 0 ) {
    //	cout << "First event: " << endl;
    //	Print::listing(evt);
    //}
    //root_output.write_event(evt);
    //++events_parsed;
    //
    //if( events_parsed%1000 == 0 ) {
    //	cout << "Event: " << events_parsed << endl;
    //}
    //}

}

