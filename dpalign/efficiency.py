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

outfilename="efficiency"

c = TCanvas("c","c",1200,900);
c.Print(outfilename+".pdf[")



def make_effplots():
    hitcut = "abs(({0})-({1}))<2".format(bar_var,barexp_var) # require hit in the extrapolated bar or the adjacent bar

    events.Draw("{0}:{1}>>hexp2d({2},{3})".format(y_var,x_var,x_binning,y_binning),"","colz");
    c.Print(outfilename+".pdf");

    events.Draw("{0}:{1}>>hexp2d_withhit({2},{3})".format(y_var,x_var,x_binning,y_binning),hitcut,"colz");
    c.Print(outfilename+".pdf");

    numerator = gDirectory.Get("hexp2d_withhit")
    denominator = gDirectory.Get("hexp2d")
    #numerator.Sumw2();
    numerator.Divide(denominator)
    numerator.GetZaxis().SetRangeUser(0,1)
    numerator.SetTitle("efficiency vs. position, {0}, no quad cut;extrapolated x [cm];extrapolated y [cm]".format(station))
    numerator.Draw("colz");
    c.Print(outfilename+".pdf");
    for quad in range(0,4):
        quadcut = "quad=={0}".format(quad)
        flipped_x = x_var+"*({0})".format(1 if quad%2==0 else -1) # extrapolated X flipped such that the fiducial area is on the positive side
        flipped_y = y_var+"*({0})".format(1 if quad<2 else -1) # extrapolated Y flipped such that the fiducial area is on the positive side
        fiducialcut_x = "{0}>{1}".format(flipped_x,xedge[quad])
        fiducialcuts = "{0} && {1}>{2}".format(fiducialcut_x,flipped_y,yedge[quad])

        '''
        events.Draw("fElementID_exp-1>>hhits_exp(40,-0.5,39.5)",quadcut,"");
        events.Draw("fElementID_exp-1>>hhits(40,-0.5,39.5)",quadcut+" && "+hitcut,"");
        gDirectory.Get("hhits").Sumw2();
        gDirectory.Get("hhits").Divide(gDirectory.Get("hhits_exp"));
        gDirectory.Get("hhits").Draw();
        c.Print(outfilename+".pdf");
        '''

        events.Draw(barexp_var+">>hhits_exp(60,-0.5,59.5)"," && ".join([quadcut,fiducialcuts]),"");
        events.Draw(barexp_var+">>hhits(60,-0.5,59.5)"," && ".join([quadcut,fiducialcuts,hitcut]),"");
        numerator = gDirectory.Get("hhits")
        denominator = gDirectory.Get("hhits_exp")
        numerator.Sumw2();
        numerator.Divide(denominator)
        numerator.GetYaxis().SetRangeUser(0,1.1)
        numerator.SetTitle("efficiency vs. bar, {0}, quad {1};extrapolated bar ID;efficiency".format(station,quad))
        numerator.Draw();
        c.Print(outfilename+".pdf");

        events.Draw(barexp_var+">>hhits_exp(60,-0.5,59.5)"," && ".join([quadcut,fiducialcuts]),"");
        events.Draw(bar_var+">>hhits(60,-0.5,59.5)"," && ".join([quadcut,fiducialcuts,hitcut]),"");
        numerator = gDirectory.Get("hhits")
        denominator = gDirectory.Get("hhits_exp")
        numerator.Sumw2();
        numerator.Divide(denominator)
        numerator.GetYaxis().SetRangeUser(0,1.1)
        numerator.SetTitle("efficiency vs. bar, {0}, quad {1};hit bar ID;efficiency".format(station,quad))
        numerator.Draw();
        c.Print(outfilename+".pdf");

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
            #c.Print(outfilename+".pdf");
        hs.Draw("nostack")
        leg.Draw()
        c.Print(outfilename+".pdf");
        '''

        events.Draw(flipped_y+">>hy_exp({0})".format(flipped_y_binning)," && ".join([quadcut,fiducialcut_x]),"");
        #c.Print(outfilename+".pdf");
        events.Draw(flipped_y+">>hy({0})".format(flipped_y_binning)," && ".join([quadcut,fiducialcut_x,hitcut]),"");
        #c.Print(outfilename+".pdf");
        numerator = gDirectory.Get("hy")
        denominator = gDirectory.Get("hy_exp")
        #numerator.Sumw2();
        numerator.Divide(denominator)
        numerator.GetYaxis().SetRangeUser(0,1.1)
        numerator.SetTitle("efficiency vs. position, {0}, quad {1};extrapolated y [cm];efficiency".format(station,quad))
        numerator.Draw();
        c.Print(outfilename+".pdf");

        #events.Draw("ty*797+y0:tx*797+x0>>hexp2d_fid(200,-50,50,200,-50,50)",fiducialcuts,"colz");
        #c.Print(outfilename+".pdf");

        events.Draw("{0}:{1}>>hexp2d({2},{3})".format(y_var,x_var,x_binning,y_binning),quadcut,"colz");
        c.Print(outfilename+".pdf");
        events.Draw("{0}:{1}>>hexp2d_withhit({2},{3})".format(y_var,x_var,x_binning,y_binning)," && ".join([quadcut,hitcut]),"colz");
        c.Print(outfilename+".pdf");
        numerator = gDirectory.Get("hexp2d_withhit")
        denominator = gDirectory.Get("hexp2d")
        #numerator.Sumw2();
        numerator.Divide(denominator)
        numerator.GetZaxis().SetRangeUser(0,1)
        numerator.SetTitle("efficiency vs. position, {0}, quad {1};extrapolated x [cm];extrapolated y [cm]".format(station,quad))
        numerator.Draw("colz");
        c.Print(outfilename+".pdf");

        '''
        events.Draw("fElementID_exp-1:tx*797+x0>>hhits2d_exp(20,-50,50,40,-0.5,39.5)",quadcut,"");
        events.Draw("fElementID_exp-1:tx*797+x0>>hhits2d(20,-50,50,40,-0.5,39.5)",quadcut+" && "+hitcut,"");
        gDirectory.Get("hhits2d").Divide(gDirectory.Get("hhits2d_exp"));
        gDirectory.Get("hhits2d").GetZaxis().SetRangeUser(0,1);
        gDirectory.Get("hhits2d").Draw("colz");
        c.Print(outfilename+".pdf");
        '''

station = "St1"
x_binning = "200,-50,50"
y_binning = "500,-50,50"
flipped_y_binning = "500,0,50"

yedge = [8.7, 8.3, 7.1, 7.4]
xedge = [-2.0, 2.0, -2.0, 2.0]

x_var = "(tx*797+x0)"
y_var = "(ty*797+y0)"

bar_var = "fElementID"
barexp_var = "fElementID_exp-1"

make_effplots()

station = "St2"
x_binning = "200,-100,100"
y_binning = "1200,-120,120"
flipped_y_binning = "1200,0,120"

yedge = [8.2, 8.2, 7.5, 7.6]
xedge = [1.0, -1.0, 1.0, -1.0]

x_var = "(tx*1497+x0)"
y_var = "(ty*1497+y0)"

bar_var = "bElementID"
barexp_var = "bElementID_exp-1"

make_effplots()

c.Print(outfilename+".pdf]");
