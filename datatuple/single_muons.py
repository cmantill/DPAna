#!/usr/bin/env python
import sys
import math
from ROOT import gROOT, gStyle, TFile, TTree, TChain, TMVA, TCut, TCanvas, gDirectory, TH1, TGraph, gPad, TF1, THStack, TLegend, TLatex
import getopt

gROOT.SetBatch(True)
gStyle.SetOptStat(111111)
gStyle.SetOptFit(1)
datafile = TFile("datatuple.root")
nim2file = TFile("nim2.root")
nim3file = TFile("nim3.root")
#outFile = TFile(remainder[0]+".root","RECREATE")
nim2events = nim2file.Get("save")
nim3events = nim3file.Get("save")

outfilename="single_muons"

c = TCanvas("c","c",1200,900);
c.Print(outfilename+".pdf[")

yoffset = 0.0
#yoffset = 1.6

c.Divide(2,2)
for sign in [1,2]:
    for events in [nim2events,nim3events]:
        c.cd()
        signname = "positive" if (sign==1) else "negative"
        eventsname = "NIM2" if (events==nim2events) else "NIM3"
        heading = TLatex(0.5, 0.96, "{0} trigger, {1} tracks".format(eventsname,signname));
        heading.SetNDC();
        heading.SetTextAlign(22);
        heading.SetTextSize(0.03);
        heading.Draw();


        y_st1 = "y{0}+797*ty{0}".format(sign)
        x_st1 = "x{0}_st1+797*tx{0}_st1".format(sign)
        y_st2 = "y{0}+1497*ty{0}".format(sign)
        x_st2 = "x{0}+1497*tx{0}".format(sign)
        z_yzplane = "-(y{0}-{1})/ty{0}".format(sign,yoffset)
        trackqualitycut = "x{0}<900".format(sign)
        quadrantcut = "({0})*({1})>0 && ({2})*({3})>0".format(x_st1,x_st2,y_st1,y_st2)
        fiducialcut = "abs({0})>8 && abs({1})>8".format(y_st1, y_st2)
        acceptancecut = "{0}>350 && {0}<650".format(z_yzplane)

        print(" && ".join([trackqualitycut,acceptancecut,quadrantcut]))
        print(" && ".join([trackqualitycut,acceptancecut,quadrantcut,fiducialcut]))
        c.cd(1)
        #events.Draw("{0}:{1}>>h1(100,-1000,1000,100,-150,150)".format(y_st2,z_yzplane)," && ".join([trackqualitycut,fiducialcut,quadrantcut]),"colz")
        events.Draw("{0}>>h1(100,-50,50)".format(y_st1)," && ".join([trackqualitycut,acceptancecut,quadrantcut]),"")
        gDirectory.Get("h1").SetTitle("extrapolated Y in St1, no fiducial cut;extrapolated Y [cm]")
        c.cd(2)
        events.Draw("{0}>>h2(100,-50,50)".format(y_st1)," && ".join([trackqualitycut,acceptancecut,quadrantcut,fiducialcut]),"")
        gDirectory.Get("h2").SetTitle("extrapolated Y in St1, with fiducial cut;extrapolated Y [cm]")
        c.cd(3)
        events.Draw("{0}:{1}>>h3(100,-150,150,100,-50,50)".format(y_st1,x_st1)," && ".join([trackqualitycut,acceptancecut,quadrantcut,fiducialcut]),"colz")
        gDirectory.Get("h3").SetTitle("extrapolated position in St1, with fiducial cut;extrapolated X [cm];;extrapolated Y [cm]")
        c.cd(4)
        events.Draw("{0}:{1}>>h4(100,-150,150,100,-150,150)".format(y_st2,x_st2)," && ".join([trackqualitycut,acceptancecut,quadrantcut,fiducialcut]),"colz")
        gDirectory.Get("h4").SetTitle("extrapolated position in St2, with fiducial cut;extrapolated X [cm];;extrapolated Y [cm]")
        #events.Draw("{0}>>h4(100,-50,50)".format(y_st1)," && ".join([trackqualitycut,acceptancecut,quadrantcut,fiducialcut]),"")
        #gPad.SetLogy(1)
        c.Print(outfilename+".pdf");
        #gPad.SetLogy(0)

c.Print(outfilename+".pdf]");

'''
def make_effplots():
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

        events.Draw(bar_var+">>hhits_exp(60,-0.5,59.5)"," && ".join([quadcut,fiducialcuts]),"");
        #c.Print(outfilename+".pdf");
        events.Draw(bar_var+">>hhits(60,-0.5,59.5)"," && ".join([quadcut,fiducialcuts,hitcut]),"");
        #c.Print(outfilename+".pdf");
        numerator = gDirectory.Get("hhits")
        denominator = gDirectory.Get("hhits_exp")
        numerator.Sumw2();
        numerator.Divide(denominator)
        numerator.GetYaxis().SetRangeUser(0,1.1)
        numerator.SetTitle("efficiency vs. bar, {0}, quad {1};bar ID;efficiency".format(station,quad))
        numerator.Draw();
        c.Print(outfilename+".pdf");


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


station = "St1"
x_binning = "200,-50,50"
y_binning = "500,-50,50"
flipped_y_binning = "500,0,50"

yedge = [8.7, 8.3, 7.1, 7.4]
xedge = [-2.0, 2.0, -2.0, 2.0]

x_var = "(tx*797+x0)"
y_var = "(ty*797+y0)"

bar_var = "fElementID_exp-1"
hitcut = "abs(fElementID-fElementID_exp+1)<2" # require hit in the extrapolated bar or the adjacent bar

make_effplots()

station = "St2"
x_binning = "200,-100,100"
y_binning = "1200,-120,120"
flipped_y_binning = "1200,0,120"

yedge = [8.2, 8.2, 7.5, 13.3]
xedge = [1.0, -1.0, 1.0, -1.0]

x_var = "(tx*1497+x0)"
y_var = "(ty*1497+y0)"

bar_var = "bElementID_exp-1"
hitcut = "abs(bElementID-bElementID_exp+1)<2" # require hit in the extrapolated bar or the adjacent bar

make_effplots()

c.Print(outfilename+".pdf]");
'''
