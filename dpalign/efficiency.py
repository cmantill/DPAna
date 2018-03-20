#!/usr/bin/env python
import sys
import math
from ROOT import gROOT, gStyle, TFile, TTree, TChain, TMVA, TCut, TCanvas, gDirectory, TH1, TGraph, gPad, TF1, THStack, TLegend
import getopt

gROOT.SetBatch(True)
gStyle.SetOptStat(0)
gStyle.SetOptFit(1)
inFile = TFile("dpalign.root")
#outFile = TFile(remainder[0]+".root","RECREATE")
events = inFile.Get("save")

outfilename="blah"

c = TCanvas("c","c",1200,900);
c.Print(outfilename+".pdf[")


events.Draw("ty*797+y0:tx*797+x0>>hexp2d(200,-50,50,200,-50,50)","","colz");
c.Print("blah.pdf");

events.Draw("ty*797+y0:tx*797+x0>>hexp2d_withhit(200,-50,50,200,-50,50)","abs(fElementID-fElementID_exp+1)<2","colz");
c.Print("blah.pdf");

gDirectory.Get("hexp2d_withhit").Divide(gDirectory.Get("hexp2d"));
gDirectory.Get("hexp2d_withhit").GetZaxis().SetRangeUser(0,1);
gDirectory.Get("hexp2d_withhit").Draw("colz");
c.Print("blah.pdf");

yedge = [8.7, 8.3, 7.1, 7.4]
xedge = [-2.0, 2.0, -2.0, 2.0]

for quad in range(0,4):
    quadcut = "quad=={0}".format(quad)
    flipped_x = "(tx*797+x0)*({0})".format(1 if quad%2==0 else -1) # extrapolated X flipped such that the fiducial area is on the positive side
    flipped_y = "(ty*797+y0)*({0})".format(1 if quad<2 else -1) # extrapolated Y flipped such that the fiducial area is on the positive side
    fiducialcuts = "{0}>{1} && {2}>{3}".format(flipped_x,xedge[quad],flipped_y,yedge[quad])
    hitcut = "abs(fElementID-fElementID_exp+1)<2" # require hit in the extrapolated bar or the adjacent bar

    '''
    events.Draw("fElementID_exp-1>>hhits_exp(40,-0.5,39.5)",quadcut,"");
    events.Draw("fElementID_exp-1>>hhits(40,-0.5,39.5)",quadcut+" && "+hitcut,"");
    gDirectory.Get("hhits").Sumw2();
    gDirectory.Get("hhits").Divide(gDirectory.Get("hhits_exp"));
    gDirectory.Get("hhits").Draw();
    c.Print("blah.pdf");
    '''

    events.Draw("fElementID_exp-1>>hhits_exp(40,-0.5,39.5)",quadcut+" && "+fiducialcuts,"");
    #c.Print("blah.pdf");
    events.Draw("fElementID_exp-1>>hhits(40,-0.5,39.5)",quadcut+" && "+fiducialcuts+" && "+hitcut,"");
    #c.Print("blah.pdf");
    gDirectory.Get("hhits").Sumw2();
    gDirectory.Get("hhits").Divide(gDirectory.Get("hhits_exp"));
    gDirectory.Get("hhits").Draw();
    c.Print("blah.pdf");

    '''
    leg = TLegend(0.0,0.75,0.2,0.9)
    for xslice in range(0,10):
        expslicehistname = "hhits_exp_{0}".format(xslice)
        events.Draw("fElementID_exp>>{0}(40,-0.5,39.5)".format(expslicehistname),"quad=={0}&&abs(tx*797+x0-{1})<5".format(quad,xslice*10-45),"");
        slicehistname = "hhits_{0}".format(xslice)
        #print(slicehistname)
        events.Draw("fElementID>>{0}(40,-0.5,39.5)".format(slicehistname),"quad=={0} && abs(fElementID-fElementID_exp+1)<2&&abs(tx*797+x0-{1})<5".format(quad,xslice*10-45),"");
        #print("fElementID>>hhits(40,-0.5,39.5)","quad=={0} && abs(fElementID-fElementID_exp+1)<2&&abs(tx*797+x0-{1})<5".format(quad,xslice*10-45,slicehistname))
        #print("fElementID>>{0}(40,-0.5,39.5)","quad=={0} && abs(fElementID-fElementID_exp+1)<2&&abs(tx*797+x0-{1})<5".format(quad,xslice*10-45,slicehistname))
        #events.Draw("fElementID>>{2}(40,-0.5,39.5)","quad=={0} && abs(fElementID-fElementID_exp+1)<2&&abs(tx*797+x0-{1})<5".format(quad,xslice*10-45,slicehistname),"");
        #gDirectory.ls()
        hist = gDirectory.Get(slicehistname)
        gDirectory.Get(slicehistname).Sumw2();
        gDirectory.Get(slicehistname).Divide(gDirectory.Get(expslicehistname));
        gDirectory.Get(slicehistname).Draw();
        hist.SetLineColor(xslice+1)
        leg.AddEntry(hist,"abs(tx*797+x0-{1})<5".format(quad,xslice*10-45))
        if (xslice==0):
            gDirectory.Get(slicehistname).GetYaxis().SetRangeUser(0,1);
            hs = THStack("hs",gDirectory.Get(slicehistname).GetTitle());
            gDirectory.Get(slicehistname).DrawClone();
        else:
            gDirectory.Get(slicehistname).DrawClone("same");
        hs.Add(gDirectory.Get(slicehistname))
        #c.Print("blah.pdf");
    hs.Draw("nostack")
    leg.Draw()
    c.Print("blah.pdf");
    '''

    events.Draw(flipped_y+">>hy_exp(500,0,50)",quadcut+" && "+fiducialcuts,"");
    #c.Print("blah.pdf");
    events.Draw(flipped_y+">>hy(500,0,50)",quadcut+" && "+fiducialcuts+" && "+hitcut,"");
    #c.Print("blah.pdf");
    #gDirectory.Get("hy").Sumw2();
    gDirectory.Get("hy").Divide(gDirectory.Get("hy_exp"));
    gDirectory.Get("hy").Draw();
    c.Print("blah.pdf");

    #events.Draw("ty*797+y0:tx*797+x0>>hexp2d_fid(200,-50,50,200,-50,50)",fiducialcuts,"colz");
    #c.Print("blah.pdf");

    events.Draw("ty*797+y0:tx*797+x0>>hexp2d(200,-50,50,500,-50,50)",quadcut,"colz");
    c.Print("blah.pdf");
    events.Draw("ty*797+y0:tx*797+x0>>hexp2d_withhit(200,-50,50,500,-50,50)",quadcut+" && "+hitcut,"colz");
    c.Print("blah.pdf");
    gDirectory.Get("hexp2d_withhit").Divide(gDirectory.Get("hexp2d"));
    gDirectory.Get("hexp2d_withhit").GetZaxis().SetRangeUser(0,1);
    gDirectory.Get("hexp2d_withhit").Draw("colz");
    c.Print("blah.pdf");

    '''
    events.Draw("fElementID_exp-1:tx*797+x0>>hhits2d_exp(20,-50,50,40,-0.5,39.5)",quadcut,"");
    events.Draw("fElementID_exp-1:tx*797+x0>>hhits2d(20,-50,50,40,-0.5,39.5)",quadcut+" && "+hitcut,"");
    gDirectory.Get("hhits2d").Divide(gDirectory.Get("hhits2d_exp"));
    gDirectory.Get("hhits2d").GetZaxis().SetRangeUser(0,1);
    gDirectory.Get("hhits2d").Draw("colz");
    c.Print("blah.pdf");
    '''

c.Print("blah.pdf]");
