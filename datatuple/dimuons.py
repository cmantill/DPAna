#!/usr/bin/env python
import sys
import math
from ROOT import gROOT, gStyle, TFile, TTree, TChain, TMVA, TCut, TCanvas, gDirectory, TH1, TGraph, gPad, TF1, THStack, TLegend
import getopt

gROOT.SetBatch(True)
gStyle.SetOptStat(111111)
gStyle.SetOptFit(1)
allfile = TFile("dimuons.root")
displacedfile = TFile("displacedtracks.root")
nim2file = TFile("nim2.root")
nim3file = TFile("nim3.root")
#outFile = TFile(remainder[0]+".root","RECREATE")
allevents = allfile.Get("save")
displacedevents = displacedfile.Get("save")
nim2events = nim2file.Get("save")
nim3events = nim3file.Get("save")

outfilename="dimuons"

c = TCanvas("c","c",1200,900);
c.Print(outfilename+".pdf[")

allthecuts = "x2<900 && (x2_st1+797*tx2_st1)*(x2+1497*tx2)>0 && x1<900 && (x1_st1+797*tx1_st1)*(x1+1497*tx1)>0 && (y2+797*ty2)*(y2+1497*ty2)>0 && (y1+797*ty1)*(y1+1497*ty1)>0 && abs(y2+797*ty2)>8 && abs(y1+797*ty1)>8 && abs(y1+797*ty1)<40 && abs(y2+797*ty2)<40 && abs(y2+1497*ty2)>8 && abs(y1+1497*ty1)>8 && ((y2+1497*ty2)*(y1+1497*ty1)<0 || (x2+1497*tx2)*(x1+1497*tx1)<0) && triggerBits>0 && (triggerBits & 64)==0"

y_st1 = [None]*3
x_st1 = [None]*3
y_st2 = [None]*3
x_st2 = [None]*3
y_dump = [None]*3
x_dump = [None]*3
z_yzplane = [None]*3
quad_st1 = [None]*3
quad_st2 = [None]*3

trackqualitycut = [None]*3
quadrantcut = [None]*3
fiducialcut = [None]*3
acceptancecut = [None]*3

yoffset = 0.0
#yoffset = 1.6
for sign in [1,2]:
    y_st1[sign] = "y{0}+797*ty{0}".format(sign)
    x_st1[sign] = "x{0}_st1+797*tx{0}_st1".format(sign)
    y_st2[sign] = "y{0}+1497*ty{0}".format(sign)
    x_st2[sign] = "x{0}+1497*tx{0}".format(sign)
    y_dump[sign] = "y{0}+75*ty{0}".format(sign)
    x_dump[sign] = "x{0}_st1+75*tx{0}_st1+({1})*520/pz{0}".format(sign,3-2*sign)
    z_yzplane[sign] = "-(y{0}-{1})/ty{0}".format(sign,yoffset)
    #"(0.5*(1-sign(x0+1497*tx)))+(1-sign(y0+1497*ty))"
    quad_st1[sign] = "0.5*(1-sign({0}))+1-sign({1})".format(x_st1[sign],y_st1[sign])
    quad_st2[sign] = "0.5*(1-sign({0}))+1-sign({1})".format(x_st2[sign],y_st2[sign])
    trackqualitycut[sign] = "x{0}<900".format(sign)
    quadrantcut[sign] = "({0})*({1})>0 && ({2})*({3})>0".format(x_st1[sign],x_st2[sign],y_st1[sign],y_st2[sign])
    fiducialcut[sign] = "abs({0})>8 && abs({1})>8 && abs({0})<40".format(y_st1[sign], y_st2[sign])
    acceptancecut[sign] = "{0}>450 && {0}<650".format(z_yzplane[sign])
trackqualitycut[0] = " && ".join(trackqualitycut[1:])
quadrantcut[0] = " && ".join(quadrantcut[1:])
fiducialcut[0] = " && ".join(fiducialcut[1:])
acceptancecut[0] = " && ".join(acceptancecut[1:])
differentquadrantcut = "({0})*({1})<0".format(x_st1[1],x_st1[2])

#c.Divide(2,4)
#for events in [displacedevents,nim2events,nim3events]:
#for events in [displacedevents, allevents, nim2events, nim3events]:
for events in [displacedevents, allevents]:
#for events in [displacedevents]:
    if (events==displacedevents):
        allcuts = " && ".join([trackqualitycut[0],fiducialcut[0],quadrantcut[0],acceptancecut[0],differentquadrantcut])
    else:
        allcuts = " && ".join([trackqualitycut[0],fiducialcut[0],quadrantcut[0],differentquadrantcut])

    print(allcuts)

    events.Draw("{0}:{1}>>h(100,300,800,100,300,800)".format(z_yzplane[2],z_yzplane[1]),allcuts,"colz")
    gDirectory.Get("h").SetTitle("Z from Y={0} intercept;positive track;negative track".format(yoffset))
    c.Print(outfilename+".pdf");

    events.Draw("pz2:pz1>>h(100,0,100,100,0,100)",allcuts,"colz")
    gDirectory.Get("h").SetTitle("pz;positive track;negative track")
    c.Print(outfilename+".pdf");
    
    #events.Draw("ty2:ty1>>h(100,-0.1,0.1,100,-0.1,0.1)",allcuts,"colz")
    #gDirectory.Get("h").SetTitle("ty;positive track;negative track")
    #c.Print(outfilename+".pdf");
    
    #events.Draw("tx2_st1:tx1_st1>>h(100,-0.2,0.2,100,-0.2,0.2)",allcuts,"colz")
    #gDirectory.Get("h").SetTitle("tx_st1 (before KMAG);positive track;negative track")
    #c.Print(outfilename+".pdf");
    
    #events.Draw("tx2:tx1>>h(100,-0.2,0.2,100,-0.2,0.2)",allcuts,"colz")
    #gDirectory.Get("h").SetTitle("tx (after KMAG);positive track;negative track")
    #c.Print(outfilename+".pdf");
    
    #events.Draw("{0}:tx1_st1>>h(100,-0.2,0.2,100,-100,100)".format(x_st1[1]),allcuts,"colz")
    #gDirectory.Get("h").SetTitle("positive track;tx_st1;extrapolated X at St1")
    #c.Print(outfilename+".pdf");
    
    #events.Draw("{0}:tx2_st1>>h(100,-0.2,0.2,100,-100,100)".format(x_st1[2]),allcuts,"colz")
    #gDirectory.Get("h").SetTitle("negative track;tx_st1;extrapolated X at St1")
    #c.Print(outfilename+".pdf");
    
    events.Draw("triggerBits>>h(10,-0.5,9.5)",allcuts,"colz")
    gDirectory.Get("h").SetTitle("triggerBits")
    c.Print(outfilename+".pdf");
    
    events.Draw("nTracks>>h(10,-0.5,9.5)",allcuts,"colz")
    gDirectory.Get("h").SetTitle("nTracks")
    c.Print(outfilename+".pdf");
    
    events.Draw("spillID>>h(100,1407e3,1417e3)",allcuts,"colz")
    gDirectory.Get("h").SetTitle("spillID")
    c.Print(outfilename+".pdf");
    
    events.Draw("chisq2:chisq1>>h(100,0,50,100,0,50)",allcuts,"colz")
    gDirectory.Get("h").SetTitle("chisq;positive track;negative track")
    c.Print(outfilename+".pdf");
    
    events.Draw("nHits2:nHits1>>h(10,10.5,20.5,10,10.5,20.5)",allcuts,"colz")
    gDirectory.Get("h").SetTitle("nHits;positive track;negative track")
    c.Print(outfilename+".pdf");
    
    #events.Draw("chisq1:nHits1>>h(10,10.5,20.5,100,0,50)",allcuts,"colz")
    #gDirectory.Get("h").SetTitle("positive track;nHits;chisq")
    #c.Print(outfilename+".pdf");
    
    #events.Draw("chisq2:nHits2>>h(10,10.5,20.5,100,0,50)",allcuts,"colz")
    #gDirectory.Get("h").SetTitle("negative track;nHits;chisq")
    #c.Print(outfilename+".pdf");
    print(quad_st1[1])
    
    events.Draw("{0}:{1}>>h(4,-0.5,3.5,4,-0.5,3.5)".format(quad_st1[2],quad_st1[1]),allcuts,"colz")
    gDirectory.Get("h").SetTitle("quadrants;positive track;negative track")
    c.Print(outfilename+".pdf");
    
    events.Draw("{0}:{1}>>h(100,-150,150,100,-50,50)".format(y_st1[1],x_st1[1]),allcuts,"colz")
    gDirectory.Get("h").SetTitle("positive track extrapolated to St1;X [cm];Y [cm]")
    c.Print(outfilename+".pdf");

    events.Draw("{0}:{1}>>h(100,-150,150,100,-50,50)".format(y_st1[2],x_st1[2]),allcuts,"colz")
    gDirectory.Get("h").SetTitle("negative track extrapolated to St1;X [cm];Y [cm]")
    c.Print(outfilename+".pdf");
    
    events.Draw("{0}:{1}>>h(100,-150,150,100,-150,150)".format(y_st2[1],x_st2[1]),allcuts,"colz")
    gDirectory.Get("h").SetTitle("positive track extrapolated to St2;X [cm];Y [cm]")
    c.Print(outfilename+".pdf");

    events.Draw("{0}:{1}>>h(100,-150,150,100,-150,150)".format(y_st2[2],x_st2[2]),allcuts,"colz")
    gDirectory.Get("h").SetTitle("negative track extrapolated to St2;X [cm];Y [cm]")
    c.Print(outfilename+".pdf");
    
    events.Draw("{0}:{1}>>h(100,-50,50,100,-50,50)".format(y_st1[2],y_st1[1]),allcuts,"colz")
    gDirectory.Get("h").SetTitle("extrapolated Y at St1;positive track [cm];negative track [cm]")
    c.Print(outfilename+".pdf");
    
    events.Draw("{0}:{1}>>h(100,-150,150,100,-150,150)".format(y_st2[2],y_st2[1]),allcuts,"colz")
    gDirectory.Get("h").SetTitle("extrapolated Y at St2;positive track [cm];negative track [cm]")
    c.Print(outfilename+".pdf");

    events.Draw("{0}:{1}>>h(100,-50,50,100,-50,50)".format(x_dump[2],x_dump[1]),allcuts,"colz")
    gDirectory.Get("h").SetTitle("extrapolated X at dump;positive track [cm];negative track [cm]")
    c.Print(outfilename+".pdf");

    events.Draw("{0}:{1}>>h(100,-50,50,100,-50,50)".format(y_dump[2],y_dump[1]),allcuts,"colz")
    gDirectory.Get("h").SetTitle("extrapolated Y at dump;positive track [cm];negative track [cm]")
    c.Print(outfilename+".pdf");

    #c.cd(1); events.Draw("{0}:{1}>>h1(100,-100,1000,100,-150,150)".format(y_st2[1],z_yzplane[1])," && ".join([trackqualitycut[0],fiducialcut[0],quadrantcut[0],acceptancecut[0],differentquadrantcut]),"colz")

c.Print(outfilename+".pdf]");

