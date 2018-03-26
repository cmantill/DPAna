#include <iostream>
#include <cmath>
#include "TTree.h"
#include "TFile.h"
#include "TROOT.h"

using namespace std;

Double_t dot(Double_t *v1, Double_t *v2) {
    return v1[0]*v2[0] +  v1[1]*v2[1] + v1[2]*v2[2];
}

int make_vtx(const char* inFile = "datatuple.root",
        const char* outFile = "vtx_test.root" ){


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
    //Double_t        tx1;
    Double_t        ty1;
    Double_t        x1_st1;
    //Double_t        x1;
    Double_t        y1;
    Double_t        tx2_st1;
    //Double_t        tx2;
    Double_t        ty2;
    Double_t        x2_st1;
    //Double_t        x2;
    Double_t        y2;
    //Double_t        pz1;
    //Double_t        pz2;

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
    //save->SetBranchAddress("tx1",&tx1);
    save->SetBranchAddress("ty1",&ty1);
    save->SetBranchAddress("x1_st1",&x1_st1);
    //save->SetBranchAddress("x1",&x1);
    save->SetBranchAddress("y1",&y1);
    save->SetBranchAddress("tx2_st1",&tx2_st1);
    //save->SetBranchAddress("tx2",&tx2);
    save->SetBranchAddress("ty2",&ty2);
    save->SetBranchAddress("x2_st1",&x2_st1);
    //save->SetBranchAddress("x2",&x2);
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


        if (pos_vec[0]<900 && neg_vec[0]<900) { // only vertex events that have both tracks
            diff_orgs[0] = pos_org[0] - neg_org[0];
            diff_orgs[1] = pos_org[1] - neg_org[1];

            // find the distance between the lines using the formula on the Wikipedia article ``skew lines''
            cross_vecs[0] = (pos_vec[1]*neg_vec[2]) - (pos_vec[2]*neg_vec[1]);
            cross_vecs[1] = (pos_vec[2]*neg_vec[0]) - (pos_vec[0]*neg_vec[2]);
            cross_vecs[2] = (pos_vec[0]*neg_vec[1]) - (pos_vec[1]*neg_vec[0]);
            cross_norm = sqrt(dot(cross_vecs, cross_vecs));
            vtx_dist = abs(dot(cross_vecs, diff_orgs)) / cross_norm;


            // find the vertex: this uses the Wikipedia article's formulas for the nearest points on each line to the other line
            // compute some values to be used in the next step
            dposdpos = dot(pos_vec, pos_vec);
            dnegdneg = dot(neg_vec, neg_vec);
            dposdneg = dot(pos_vec, neg_vec);

            dpospdiff = dot(pos_vec, diff_orgs);
            dnegpdiff = dot(neg_vec, diff_orgs);

            // z_pos is the coefficient of d1, numerator and denominator refer to the formula, the numerator formula used here replaces the cross products with dot products using Laplace's identity
            numerator_pos = dnegpdiff*dposdneg - dpospdiff*dnegdneg;
            numerator_neg = dnegpdiff*dposdpos - dpospdiff*dposdneg;
            denominator = dposdpos*dnegdneg - dposdneg*dposdneg;
            z_pos = numerator_pos/denominator;
            z_neg = numerator_neg/denominator;

            vtx_x = (pos_org[0] + z_pos*pos_vec[0] + neg_org[0] + z_neg*neg_vec[0])*0.5;
            vtx_y = (pos_org[1] + z_pos*pos_vec[1] + neg_org[1] + z_neg*neg_vec[1])*0.5;
            vtx_z = (z_pos + z_neg)*0.5;
        } else {
            vtx_dist = 999.0;
            vtx_x = 999.0;
            vtx_y = 999.0;
            vtx_z = 999.0;
        }
        if (i<10) {
            cout << "vtx_dist: " << vtx_dist << " vtx_x: " << vtx_x << " vtx_y: " << vtx_y << " vtx_z: " << vtx_z << endl;
        }
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
