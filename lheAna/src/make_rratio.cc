#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <vector>
#include <unistd.h>

using namespace std;

#include <gsl/gsl_rng.h>
#include <gsl/gsl_randist.h>

#include <TSpline.h>
#include <TMath.h>
#include <TFile.h>
#include <TTree.h>
#include <TH1D.h>


// takes input stdhep file, applies beam rotation and width, and writes to a new stdhep file
int main(int argc,char** argv)
{
    int c;

    while ((c = getopt(argc,argv,"h")) !=-1)
        switch (c)
        {
            case 'h':
                printf("-h: print this help\n");
                return(0);
                break;
            case '?':
                printf("Invalid option or missing option argument; -h to list options\n");
                return(1);
            default:
                abort();
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

    TFile* saveFile = new TFile("r_ratio.root", "recreate");
    TSpline3 * r_spline = new TSpline3("R_ratio", e_cm, r_ratio, n_rpoints, "", 0.0, r_ratio[n_rpoints-1]);
    r_spline->SetName("R_ratio");
    //TSpline3 * r_spline = new TSpline3("R_ratio", e_cm, r_ratio, n_rpoints);

    r_spline->Write();
    saveFile->Write();
    saveFile->Close();
    }

