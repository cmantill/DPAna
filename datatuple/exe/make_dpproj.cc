#include <iostream>
#include <cmath>
#include "TTree.h"
#include "TFile.h"
#include "TROOT.h"
#include "TMath.h"

#include "GeomSvc.h"

using namespace std;

int make_vtx(const char* inFile = "datatuple.root",
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
    dpPlanes[0].y0 = 0.145 + 3.003*2.54 + dpPlanes[0].nElements*dpPlanes[0].cellWidth/2. + 0.059193;
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
    dpPlanes[1].y0 = 0.145 + 3.003*2.54 + dpPlanes[1].nElements*dpPlanes[1].cellWidth/2. - 0.6556508;
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
    dpPlanes[2].y0 = 0.145 - 3.003*2.54 - dpPlanes[2].nElements*dpPlanes[2].cellWidth/2. + 1.52231;
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
    dpPlanes[3].y0 = 0.145 - 3.003*2.54 - dpPlanes[3].nElements*dpPlanes[3].cellWidth/2. + 0.952712;
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
    dpPlanes[4].y0 = 0.691 + 3.0083*2.54 + dpPlanes[4].nElements*dpPlanes[4].cellWidth/2. - 2.02706;
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
    dpPlanes[5].y0 = 0.691 + 3.0083*2.54 + dpPlanes[5].nElements*dpPlanes[5].cellWidth/2. - 2.04749;
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
    dpPlanes[6].y0 = 0.691 - 3.0083*2.54 - dpPlanes[6].nElements*dpPlanes[6].cellWidth/2. + 1.30634;
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
    dpPlanes[7].y0 = 0.691 - 3.0083*2.54 - dpPlanes[7].nElements*dpPlanes[7].cellWidth/2. + 1.26992;
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
    TTree *vtx = new TTree("vtx","vtx");

    //Declaration of leaves types

    //Int_t           runID;
    //Int_t           spillID;
    //Int_t           eventID;
    //Int_t           triggerBits;
    //Int_t           nTracks;
    //Int_t           nHits1;
    //Int_t           nHits2;
    //Double_t        chisq1;
    //Double_t        chisq2;
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

    // Set branch addresses.
    //save->SetBranchAddress("runID",&runID);
    //save->SetBranchAddress("spillID",&spillID);
    //save->SetBranchAddress("eventID",&eventID);
    //save->SetBranchAddress("triggerBits",&triggerBits);
    //save->SetBranchAddress("nTracks",&nTracks);
    //save->SetBranchAddress("nHits1",&nHits1);
    //save->SetBranchAddress("nHits2",&nHits2);
    //save->SetBranchAddress("chisq1",&chisq1);
    //save->SetBranchAddress("chisq2",&chisq2);
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
    //save->SetBranchAddress("pz1",&pz1);
    //save->SetBranchAddress("pz2",&pz2);

    //output variables
    Double_t vtx_dist;
    Double_t vtx_x;
    Double_t vtx_y;
    Double_t vtx_z;

    vtx->Branch("vtx_dist",&vtx_dist,"vtx_dist/D");
    vtx->Branch("vtx_x",&vtx_x,"vtx_x/D");
    vtx->Branch("vtx_y",&vtx_y,"vtx_y/D");
    vtx->Branch("vtx_z",&vtx_z,"vtx_z/D");

    Long64_t nentries = save->GetEntries();
    cout << "nentries =" << nentries << endl;

    Double_t pos_vec[3], neg_vec[3], pos_org[3], neg_org[3];
    pos_vec[2] = 1.0;
    neg_vec[2] = 1.0;
    pos_org[2] = 0.0;
    neg_org[2] = 0.0;
    Double_t diff_orgs[3], cross_vecs[3];
    Double_t cross_norm;
    diff_orgs[2] = 0.0;
    Double_t dposdpos, dnegdneg, dposdneg, dpospdiff, dnegpdiff, numerator_pos, numerator_neg, denominator, z_pos, z_neg;
    for (Long64_t i=0; i<nentries;i++) {
        save->GetEntry(i);
        pos_vec[0] = tx1_st1;
        pos_vec[1] = ty1;
        neg_vec[0] = tx2_st1;
        neg_vec[1] = ty2;
        pos_org[0] = x1_st1;
        pos_org[1] = y1;
        neg_org[0] = x2_st1;
        neg_org[1] = y2;


        vtx->Fill();
    }
    vtx->Write();
    outF->Close();
}

# ifndef __CINT__
int main(int argc, char* argv[])
{
    if (argc!=3) {
        cout << "Usage: " << argv[0] << " <input ROOT file name> <output ROOT file name>" << endl;
        return 1;
    }
    make_vtx(argv[1], argv[2]);
    return 0;
}
# endif
