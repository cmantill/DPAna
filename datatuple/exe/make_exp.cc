#include <iostream>
#include <cmath>
#include "TTree.h"
#include "TFile.h"
#include "TROOT.h"
#include "TMath.h"

#include "GeomSvc.h"

using namespace std;

//extrapolate tracks to the dark photon hodoscopes
int make_exp(const char* inFile = "datatuple.root",
        const char* outFile = "dpproj_test.root" ){

    // constants copied from kTrackerDark/exe/darkEff.cxx
    
    Plane dpPlanes[8];

    //DPLT1
    dpPlanes[0].detectorID = 55;
    dpPlanes[0].detectorName = "DPLT1";
    dpPlanes[0].planeType = 4;
    dpPlanes[0].nElements = 80;
    dpPlanes[0].spacing = 1.0099 + 0.0181967;
    dpPlanes[0].cellWidth = 1.0099 + 0.0181967;
    dpPlanes[0].xoffset = 0.;
    dpPlanes[0].overlap = 0.;
    dpPlanes[0].angleFromVert = TMath::Pi()/2.;
    dpPlanes[0].x0 = -1.48 + 40.;
    //dpPlanes[0].x0 = -1.48;
    dpPlanes[0].y0 = 0.145 + 3.003*2.54 + dpPlanes[0].nElements*dpPlanes[0].cellWidth/2. + 0.059193;
    //dpPlanes[0].y0 = 0.145 + 3.003*2.54 + 0.059193;
    dpPlanes[0].z0 = 797.86;
    dpPlanes[0].x1 = dpPlanes[0].x0 - 40.;
    dpPlanes[0].y1 = dpPlanes[0].y0 - dpPlanes[0].nElements*dpPlanes[0].cellWidth/2.;
    dpPlanes[0].x2 = dpPlanes[0].x0 + 40.;
    dpPlanes[0].y2 = dpPlanes[0].y0 + dpPlanes[0].nElements*dpPlanes[0].cellWidth/2.;
    dpPlanes[0].thetaX = -0.005914;
    dpPlanes[0].thetaY = -0.000572;
    dpPlanes[0].thetaZ = 0.005269;
    dpPlanes[0].update();

    //DPLRT1
    dpPlanes[1].detectorID = 56;
    dpPlanes[1].detectorName = "DPRT1";
    dpPlanes[1].planeType = 4;
    dpPlanes[1].nElements = 80;
    dpPlanes[1].spacing = 1.0099 + 0.0181967;
    dpPlanes[1].cellWidth = 1.0099 + 0.0181967;
    dpPlanes[1].xoffset = 0.;
    dpPlanes[1].overlap = 0.;
    dpPlanes[1].angleFromVert = TMath::Pi()/2.;
    dpPlanes[1].x0 = -1.48 - 40.;
    //dpPlanes[1].x0 = -1.48;
    dpPlanes[1].y0 = 0.145 + 3.003*2.54 + dpPlanes[1].nElements*dpPlanes[1].cellWidth/2. - 0.6556508;
    //dpPlanes[1].y0 = 0.145 + 3.003*2.54 - 0.6556508;
    dpPlanes[1].z0 = 797.86;
    dpPlanes[1].x1 = dpPlanes[1].x0 - 40.;
    dpPlanes[1].y1 = dpPlanes[1].y0 - dpPlanes[1].nElements*dpPlanes[1].cellWidth/2.;
    dpPlanes[1].x2 = dpPlanes[1].x0 + 40.;
    dpPlanes[1].y2 = dpPlanes[1].y0 + dpPlanes[1].nElements*dpPlanes[1].cellWidth/2.;
    dpPlanes[1].thetaX = -0.005914;
    dpPlanes[1].thetaY = -0.000572;
    dpPlanes[1].thetaZ = 0.005269;
    dpPlanes[1].update();

    //DPLLB1
    dpPlanes[2].detectorID = 57;
    dpPlanes[2].detectorName = "DPLB1";
    dpPlanes[2].planeType = 4;
    dpPlanes[2].nElements = 80;
    dpPlanes[2].spacing = 1.0099 + 0.0181967;
    dpPlanes[2].cellWidth = 1.0099 + 0.0181967;
    dpPlanes[2].xoffset = 0.;
    dpPlanes[2].overlap = 0.;
    dpPlanes[2].angleFromVert = TMath::Pi()/2.;
    dpPlanes[2].x0 = -1.48 + 40.;
    //dpPlanes[2].x0 = -1.48;
    dpPlanes[2].y0 = 0.145 - 3.003*2.54 - dpPlanes[2].nElements*dpPlanes[2].cellWidth/2. + 1.52231;
    //dpPlanes[2].y0 = 0.145 - 3.003*2.54 + 1.52231;
    dpPlanes[2].z0 = 797.86;
    dpPlanes[2].x1 = dpPlanes[2].x0 - 40.;
    dpPlanes[2].y1 = dpPlanes[2].y0 - dpPlanes[2].nElements*dpPlanes[2].cellWidth/2.;
    dpPlanes[2].x2 = dpPlanes[2].x0 + 40.;
    dpPlanes[2].y2 = dpPlanes[2].y0 + dpPlanes[2].nElements*dpPlanes[2].cellWidth/2.;
    dpPlanes[2].thetaX = -0.005914;
    dpPlanes[2].thetaY = -0.000572;
    dpPlanes[2].thetaZ = 0.005269;
    dpPlanes[2].update();

    //DPLRB1
    dpPlanes[3].detectorID = 58;
    dpPlanes[3].detectorName = "DPRB1";
    dpPlanes[3].planeType = 4;
    dpPlanes[3].nElements = 80;
    dpPlanes[3].spacing = 1.0099 + 0.0181967;
    dpPlanes[3].cellWidth = 1.0099 + 0.0181967;
    dpPlanes[3].xoffset = 0.;
    dpPlanes[3].overlap = 0.;
    dpPlanes[3].angleFromVert = TMath::Pi()/2.;
    dpPlanes[3].x0 = -1.48 - 40.;
    //dpPlanes[3].x0 = -1.48;
    dpPlanes[3].y0 = 0.145 - 3.003*2.54 - dpPlanes[3].nElements*dpPlanes[3].cellWidth/2. + 0.952712;
    //dpPlanes[3].y0 = 0.145 - 3.003*2.54 + 0.952712;
    dpPlanes[3].z0 = 797.86;
    dpPlanes[3].x1 = dpPlanes[3].x0 - 40.;
    dpPlanes[3].y1 = dpPlanes[3].y0 - dpPlanes[3].nElements*dpPlanes[3].cellWidth/2.;
    dpPlanes[3].x2 = dpPlanes[3].x0 + 40.;
    dpPlanes[3].y2 = dpPlanes[3].y0 + dpPlanes[3].nElements*dpPlanes[3].cellWidth/2.;
    dpPlanes[3].thetaX = -0.005914;
    dpPlanes[3].thetaY = -0.000572;
    dpPlanes[3].thetaZ = 0.005269;
    dpPlanes[3].update();

    //DPLT2
    dpPlanes[4].detectorID = 59;
    dpPlanes[4].detectorName = "DPLT2";
    dpPlanes[4].planeType = 4;
    dpPlanes[4].nElements = 50;
    dpPlanes[4].spacing = 1.8999 + 1.32615500000000004e-02;
    dpPlanes[4].cellWidth = 1.8999 + 1.32615500000000004e-02;
    dpPlanes[4].xoffset = 0.;
    dpPlanes[4].overlap = 0.;
    dpPlanes[4].angleFromVert = TMath::Pi()/2.;
    dpPlanes[4].x0 = 0.747 + 50.;
    //dpPlanes[4].x0 = 0.747;
    dpPlanes[4].y0 = 0.691 + 3.0083*2.54 + dpPlanes[4].nElements*dpPlanes[4].cellWidth/2. - 2.02706;
    //dpPlanes[4].y0 = 0.691 + 3.0083*2.54 - 2.02706;
    dpPlanes[4].z0 = 1497.88;
    dpPlanes[4].x1 = dpPlanes[4].x0 - 50.;
    dpPlanes[4].y1 = dpPlanes[4].y0 - dpPlanes[4].nElements*dpPlanes[4].cellWidth/2.;
    dpPlanes[4].x2 = dpPlanes[4].x0 + 50.;
    dpPlanes[4].y2 = dpPlanes[4].y0 + dpPlanes[4].nElements*dpPlanes[4].cellWidth/2.;
    dpPlanes[4].thetaX = 0.015964;
    dpPlanes[4].thetaY = -0.000768;
    dpPlanes[4].thetaZ = -0.001297;
    dpPlanes[4].update();

    //DPRT2
    dpPlanes[5].detectorID = 60;
    dpPlanes[5].detectorName = "DPRT2";
    dpPlanes[5].planeType = 4;
    dpPlanes[5].nElements = 50;
    dpPlanes[5].spacing = 1.8999 + 1.32615500000000004e-02;
    dpPlanes[5].cellWidth = 1.8999 + 1.32615500000000004e-02;
    dpPlanes[5].xoffset = 0.;
    dpPlanes[5].overlap = 0.;
    dpPlanes[5].angleFromVert = TMath::Pi()/2.;
    dpPlanes[5].x0 = 0.747 - 50.;
    //dpPlanes[5].x0 = 0.747;
    dpPlanes[5].y0 = 0.691 + 3.0083*2.54 + dpPlanes[5].nElements*dpPlanes[5].cellWidth/2. - 2.04749;
    //dpPlanes[5].y0 = 0.691 + 3.0083*2.54 - 2.04749;
    dpPlanes[5].z0 = 1497.88;
    dpPlanes[5].x1 = dpPlanes[5].x0 - 50.;
    dpPlanes[5].y1 = dpPlanes[5].y0 - dpPlanes[5].nElements*dpPlanes[5].cellWidth/2.;
    dpPlanes[5].x2 = dpPlanes[5].x0 + 50.;
    dpPlanes[5].y2 = dpPlanes[5].y0 + dpPlanes[5].nElements*dpPlanes[5].cellWidth/2.;
    dpPlanes[5].thetaX = 0.015964;
    dpPlanes[5].thetaY = -0.000768;
    dpPlanes[5].thetaZ = -0.001297;
    dpPlanes[5].update();

    //DPLB2
    dpPlanes[6].detectorID = 61;
    dpPlanes[6].detectorName = "DPLB2";
    dpPlanes[6].planeType = 4;
    dpPlanes[6].nElements = 50;
    dpPlanes[6].spacing = 1.8999 + 1.32615500000000004e-02;
    dpPlanes[6].cellWidth = 1.8999 + 1.32615500000000004e-02;
    dpPlanes[6].xoffset = 0.;
    dpPlanes[6].overlap = 0.;
    dpPlanes[6].angleFromVert = TMath::Pi()/2.;
    dpPlanes[6].x0 = 0.747 + 50.;
    //dpPlanes[6].x0 = 0.747;
    dpPlanes[6].y0 = 0.691 - 3.0083*2.54 - dpPlanes[6].nElements*dpPlanes[6].cellWidth/2. + 1.30634;
    //dpPlanes[6].y0 = 0.691 - 3.0083*2.54 + 1.30634;
    dpPlanes[6].z0 = 1497.88;
    dpPlanes[6].x1 = dpPlanes[6].x0 - 50.;
    dpPlanes[6].y1 = dpPlanes[6].y0 - dpPlanes[6].nElements*dpPlanes[6].cellWidth/2.;
    dpPlanes[6].x2 = dpPlanes[6].x0 + 50.;
    dpPlanes[6].y2 = dpPlanes[6].y0 + dpPlanes[6].nElements*dpPlanes[6].cellWidth/2.;
    dpPlanes[6].thetaX = 0.015964;
    dpPlanes[6].thetaY = -0.000768;
    dpPlanes[6].thetaZ = -0.001297;
    dpPlanes[6].update();

    //DPRB2
    dpPlanes[7].detectorID = 62;
    dpPlanes[7].detectorName = "DPRB2";
    dpPlanes[7].planeType = 4;
    dpPlanes[7].nElements = 50;
    dpPlanes[7].spacing = 1.8999 + 1.32615500000000004e-02;
    dpPlanes[7].cellWidth = 1.8999 + 1.32615500000000004e-02;
    dpPlanes[7].xoffset = 0.;
    dpPlanes[7].overlap = 0.;
    dpPlanes[7].angleFromVert = TMath::Pi()/2.;
    dpPlanes[7].x0 = 0.747 - 50.;
    //dpPlanes[7].x0 = 0.747;
    dpPlanes[7].y0 = 0.691 - 3.0083*2.54 - dpPlanes[7].nElements*dpPlanes[7].cellWidth/2. + 1.26992;
    //dpPlanes[7].y0 = 0.691 - 3.0083*2.54 + 1.26992;
    dpPlanes[7].z0 = 1497.88;
    dpPlanes[7].x1 = dpPlanes[7].x0 - 50.;
    dpPlanes[7].y1 = dpPlanes[7].y0 - dpPlanes[7].nElements*dpPlanes[7].cellWidth/2.;
    dpPlanes[7].x2 = dpPlanes[7].x0 + 50.;
    dpPlanes[7].y2 = dpPlanes[7].y0 + dpPlanes[7].nElements*dpPlanes[7].cellWidth/2.;
    dpPlanes[7].thetaX = 0.015964;
    dpPlanes[7].thetaY = -0.000768;
    dpPlanes[7].thetaZ = -0.001297;
    dpPlanes[7].update();

    for(Int_t i = 0; i < 8; ++i)
    {
        cout << dpPlanes[i] << endl;
    }


    //Reset ROOT and connect tree file
    gROOT->Reset();

    //--- input file 
    TFile *inF = TFile::Open(inFile, "read");
    TTree *save = (TTree *) inF->Get("save");

    //--- analysis output file and analysis plots ---
    TFile *outF = new TFile(outFile,"recreate");
    TTree *exp = new TTree("exp","exp");

    //Declaration of leaves types
    Double_t        tx1_st1;
    Double_t        tx1;
    Double_t        ty1;
    Double_t        x1_st1;
    Double_t        x1;
    Double_t        y1;
    Double_t        tx2_st1;
    Double_t        tx2;
    Double_t        ty2;
    Double_t        x2_st1;
    Double_t        x2;
    Double_t        y2;
    Double_t        pz1;
    Double_t        pz2;

    //output variables
    Double_t exp_fx1;
    Double_t exp_fy1;
    Double_t exp_bx1;
    Double_t exp_by1;
    Double_t exp_fquad1;
    Double_t exp_bquad1;
    Int_t exp_fbar1;
    Int_t exp_bbar1;
    Double_t exp_fx2;
    Double_t exp_fy2;
    Double_t exp_bx2;
    Double_t exp_by2;
    Double_t exp_fquad2;
    Double_t exp_bquad2;
    Int_t exp_fbar2;
    Int_t exp_bbar2;

    bool is_alignment_run;
    if (save->GetListOfBranches()->FindObject("x1_st1")) { // dimuon data
        is_alignment_run = false;
        // Set branch addresses.
        save->SetBranchAddress("tx1_st1",&tx1_st1);
        save->SetBranchAddress("tx1",&tx1);
        save->SetBranchAddress("ty1",&ty1);
        save->SetBranchAddress("x1_st1",&x1_st1);
        save->SetBranchAddress("x1",&x1);
        save->SetBranchAddress("y1",&y1);
        save->SetBranchAddress("tx2_st1",&tx2_st1);
        save->SetBranchAddress("tx2",&tx2);
        save->SetBranchAddress("ty2",&ty2);
        save->SetBranchAddress("x2_st1",&x2_st1);
        save->SetBranchAddress("x2",&x2);
        save->SetBranchAddress("y2",&y2);

        // Set output branches
        exp->Branch("exp_fx1",&exp_fx1,"exp_fx1/D");
        exp->Branch("exp_fy1",&exp_fy1,"exp_fy1/D");
        exp->Branch("exp_bx1",&exp_bx1,"exp_bx1/D");
        exp->Branch("exp_by1",&exp_by1,"exp_by1/D");
        exp->Branch("exp_fquad1",&exp_fquad1,"exp_fquad1/D");
        exp->Branch("exp_bquad1",&exp_bquad1,"exp_bquad1/D");
        exp->Branch("exp_fbar1",&exp_fbar1,"exp_fbar1/I");
        exp->Branch("exp_bbar1",&exp_bbar1,"exp_bbar1/I");
        exp->Branch("exp_fx2",&exp_fx2,"exp_fx2/D");
        exp->Branch("exp_fy2",&exp_fy2,"exp_fy2/D");
        exp->Branch("exp_bx2",&exp_bx2,"exp_bx2/D");
        exp->Branch("exp_by2",&exp_by2,"exp_by2/D");
        exp->Branch("exp_fquad2",&exp_fquad2,"exp_fquad2/D");
        exp->Branch("exp_bquad2",&exp_bquad2,"exp_bquad2/D");
        exp->Branch("exp_fbar2",&exp_fbar2,"exp_fbar2/I");
        exp->Branch("exp_bbar2",&exp_bbar2,"exp_bbar2/I");
    } else { // field-off alignment run
        is_alignment_run = true;
        // Set branch addresses.
        save->SetBranchAddress("tx",&tx1);
        save->SetBranchAddress("ty",&ty1);
        save->SetBranchAddress("x0",&x1);
        save->SetBranchAddress("y0",&y1);

        // Set output branches
        exp->Branch("exp_fx",&exp_fx1,"exp_fx/D");
        exp->Branch("exp_fy",&exp_fy1,"exp_fy/D");
        exp->Branch("exp_bx",&exp_bx1,"exp_bx/D");
        exp->Branch("exp_by",&exp_by1,"exp_by/D");
        exp->Branch("exp_fquad",&exp_fquad1,"exp_fquad/D");
        exp->Branch("exp_bquad",&exp_bquad1,"exp_bquad/D");
        exp->Branch("exp_fbar",&exp_fbar1,"exp_fbar/I");
        exp->Branch("exp_bbar",&exp_bbar1,"exp_bbar/I");
    }

    Long64_t nentries = save->GetEntries();
    cout << "nentries =" << nentries << endl;

    for (Long64_t i=0; i<nentries;i++) {
        save->GetEntry(i);

        //tx1 = 0;
        //ty1 = 0;
        //x1 = 10;
        //y1 = 10;

        //initialize output variables
        exp_fx1 = 999;
        exp_fy1 = 999;
        exp_bx1 = 999;
        exp_by1 = 999;
        exp_fquad1 = 999;
        exp_bquad1 = 999;
        exp_fbar1 = 999;
        exp_bbar1 = 999;
        exp_fx2 = 999;
        exp_fy2 = 999;
        exp_bx2 = 999;
        exp_by2 = 999;
        exp_fquad2 = 999;
        exp_bquad2 = 999;
        exp_fbar2 = 999;
        exp_bbar2 = 999;

            double fx, fy, bx, by; // scratch variables to store the extrapolated position relative to the current quadrant
        if (tx1<900) { // positive track exists
            for (int quad=0;quad<4;quad++) {
                if (is_alignment_run) {
                    fx = dpPlanes[quad].intercept_x(tx1, ty1, x1, y1);
                    fy = dpPlanes[quad].intercept(tx1, ty1, x1, y1) - dpPlanes[quad].wc;
                } else {
                    fx = dpPlanes[quad].intercept_x(tx1_st1, ty1, x1_st1, y1);
                    fy = dpPlanes[quad].intercept(tx1_st1, ty1, x1_st1, y1) - dpPlanes[quad].wc;
                }
                bx = dpPlanes[quad+4].intercept_x(tx1, ty1, x1, y1);
                by = dpPlanes[quad+4].intercept(tx1, ty1, x1, y1) - dpPlanes[quad+4].wc;
                if (quad%2!=0) {
                    fx *= -1;
                    bx *= -1;
                }
                if ((quad/2)%2!=0) {
                    fy *= -1;
                    by *= -1;
                }
                fy += dpPlanes[quad].nElements*dpPlanes[quad].cellWidth/2.0;
                by += dpPlanes[quad+4].nElements*dpPlanes[quad+4].cellWidth/2.0;
                fx += 40-0.1;
                bx += 50-0.1;
                if (fx>0 && fy>0) {
                    if (exp_fquad1!=999) cout << "new quad: " << quad << " old quad: " << exp_fquad1 << endl;
                    exp_fx1 = fx;
                    exp_fy1 = fy;
                    exp_fquad1 = quad;
                    exp_fbar1 = Int_t(fy/dpPlanes[quad].cellWidth);
                }
                if (bx>0 && by>0) {
                    if (exp_bquad1!=999) cout << "new quad: " << quad << " old quad: " << exp_bquad1 << endl;
                    exp_bx1 = bx;
                    exp_by1 = by;
                    exp_bquad1 = quad;
                    exp_bbar1 = Int_t(by/dpPlanes[quad+4].cellWidth);
                }
                //cout << quad;
                //cout << " tx1_st1 " << tx1 << " ty1 " << ty1 << " x1_st1 " << x1 << " y1 " << y1;
                //cout << " fX " << fx << " fY " << fy << " bX " << bx << " bY " << by << endl;
            }
        }
        if (!is_alignment_run && tx2<900) { // negative track exists
            for (int quad=0;quad<4;quad++) {
                fx = dpPlanes[quad].intercept_x(tx2_st1, ty2, x2_st1, y2);
                fy = dpPlanes[quad].intercept(tx2_st1, ty2, x2_st1, y2) - dpPlanes[quad].wc;
                bx = dpPlanes[quad+4].intercept_x(tx2, ty2, x2, y2);
                by = dpPlanes[quad+4].intercept(tx2, ty2, x2, y2) - dpPlanes[quad+4].wc;
                if (quad%2!=0) {
                    fx *= -1;
                    bx *= -1;
                }
                if ((quad/2)%2!=0) {
                    fy *= -1;
                    by *= -1;
                }
                fy += dpPlanes[quad].nElements*dpPlanes[quad].cellWidth/2.0;
                by += dpPlanes[quad+4].nElements*dpPlanes[quad+4].cellWidth/2.0;
                fx += 40-0.1;
                bx += 50-0.1;
                if (fx>0 && fy>0) {
                    if (exp_fquad2!=999) cout << "new quad: " << quad << " old quad: " << exp_fquad2 << endl;
                    exp_fx2 = fx;
                    exp_fy2 = fy;
                    exp_fquad2 = quad;
                    exp_fbar2 = Int_t(fy/dpPlanes[quad].cellWidth);
                }
                if (bx>0 && by>0) {
                    if (exp_bquad2!=999) cout << "new quad: " << quad << " old quad: " << exp_bquad2 << endl;
                    exp_bx2 = bx;
                    exp_by2 = by;
                    exp_bquad2 = quad;
                    exp_bbar2 = Int_t(by/dpPlanes[quad+4].cellWidth);
                }
                //cout << quad;
                //cout << " tx1_st1 " << tx1 << " ty1 " << ty1 << " x1_st1 " << x1 << " y1 " << y1;
                //cout << " fX " << fx << " fY " << fy << " bX " << bx << " bY " << by << endl;
            }
        }


        exp->Fill();
    }
    exp->Write();
    outF->Close();
}

# ifndef __CINT__
int main(int argc, char* argv[])
{
    if (argc!=3) {
        cout << "Usage: " << argv[0] << " <input ROOT file name> <output ROOT file name>" << endl;
        return 1;
    }
    make_exp(argv[1], argv[2]);
    return 0;
}
# endif
