#!/usr/bin/env python
import sys
import math
from ROOT import gROOT, gStyle, TFile, TTree, TChain, TMVA, TCut, TCanvas, gDirectory, TH1, TGraph, gPad, TF1, THStack, TLegend
import getopt

gROOT.SetBatch(True)
gStyle.SetOptStat(111111)
gStyle.SetOptFit(1)
#allfile = TFile("datatuple.root")
allfile = TFile("predatatuple.root")
allevents = allfile.Get("save")
#allevents.AddFriend("exp","exp_datatuple.root")

outfilename="nimrates"

c = TCanvas("c","c",1200,900);
c.Print(outfilename+".pdf[")

allthecuts = "x2<900 && (x2_st1+797*tx2_st1)*(x2+1497*tx2)>0 && x1<900 && (x1_st1+797*tx1_st1)*(x1+1497*tx1)>0 && (y2+797*ty2)*(y2+1497*ty2)>0 && (y1+797*ty1)*(y1+1497*ty1)>0 && abs(y2+797*ty2)>8 && abs(y1+797*ty1)>8 && abs(y1+797*ty1)<40 && abs(y2+797*ty2)<40 && abs(y2+1497*ty2)>8 && abs(y1+1497*ty1)>8 && ((y2+1497*ty2)*(y1+1497*ty1)<0 || (x2+1497*tx2)*(x1+1497*tx1)<0) && triggerBits>0 && (triggerBits & 64)==0"

y_st1 = [None]*3
x_st1 = [None]*3
y_st2 = [None]*3
x_st2 = [None]*3
y_dump = [None]*3
x_dump = [None]*3
y_500 = [None]*3
x_500 = [None]*3
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
    y_500[sign] = "y{0}+500*ty{0}".format(sign)
    x_500[sign] = "x{0}_st1+500*tx{0}_st1".format(sign)
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
#for events in [displacedevents, allevents]:
allcuts = " && ".join([trackqualitycut[0],fiducialcut[0],quadrantcut[0],differentquadrantcut])
displacedcuts = " && ".join([trackqualitycut[0],fiducialcut[0],quadrantcut[0],acceptancecut[0],differentquadrantcut])

nim1cuts = "triggerBits>0 && (triggerBits & 32)!=0"
nim2cuts = "triggerBits>0 && (triggerBits & 64)!=0"
nim3cuts = "triggerBits>0 && (triggerBits & 128)!=0"
events = allevents



def plotstation():
    c.Divide(2,4)
    for sign in range(1,3):
        signname = "positive" if (sign==1) else "negative"

        hnum = sign
        c.cd(hnum)
        events.Draw("y{0}+{1}*ty{0}:x{0}{5}+{1}*tx{0}{5}>>h{2}(100,-{3},{3},400,-{4},{4})".format(sign,zpos,hnum,x_range,y_range,st1),"","colz")
        gDirectory.Get("h{0}".format(hnum)).SetTitle("{0} track extrapolated to {1};X [cm];Y [cm]".format(signname,stname))

        hnum = sign+2
        c.cd(hnum)
        events.Draw("y{0}+{1}*ty{0}:y{0}+75*ty{0}>>h{2}(100,-100,100,400,-{3},{3})".format(sign,zpos,hnum,y_range),"","colz")
        gDirectory.Get("h{0}".format(hnum)).SetTitle("{0} track extrapolated to {1};Y at dump [cm];Y [cm]".format(signname,stname))

        hnum = sign+4
        c.cd(hnum)
        events.Draw("y{0}+{1}*ty{0}>>h{2}(400,-{3},{3})".format(sign,zpos,hnum,y_range),"","")
        gDirectory.Get("h{0}".format(hnum)).SetTitle("{0} track extrapolated to {1};Y [cm]".format(signname,stname))

        hnum = sign+6
        c.cd(hnum)
        events.Draw("y{0}+{1}*ty{0}>>h{2}(40,-{3},{3})".format(sign,zpos,hnum,y_range),"","")
        gDirectory.Get("h{0}".format(hnum)).SetTitle("{0} track extrapolated to {1};Y [cm]".format(signname,stname))
    c.cd()
    c.Print(outfilename+".pdf");
    c.Clear()


for cuts in [nim1cuts, nim2cuts, nim3cuts]:
#for cuts in [nim1cuts]:
    #if (events==displacedevents):
    #    allcuts = " && ".join([trackqualitycut[0],fiducialcut[0],quadrantcut[0],acceptancecut[0],differentquadrantcut])
    #else:
    #cuts = allcuts

    print(cuts)
    #events.SetEventList(0)
    #events.Draw(">>elist",cuts,"")
    #events.SetEventList(gDirectory.Get("elist"))
    events = allevents.CopyTree(cuts)


    st1 = "_st1"

    stname = "H1Y"
    zpos = 653
    x_range = 100
    y_range = 100
    plotstation()

    stname = "DPSt1"
    zpos = 797
    x_range = 100
    y_range = 100
    plotstation()

    st1 = ""

    stname = "H2Y"
    zpos = 1403
    x_range = 150
    y_range = 150
    plotstation()

    stname = "DPSt2"
    zpos = 1497
    x_range = 150
    y_range = 150
    plotstation()

    stname = "DC3"
    zpos = 1900
    x_range = 200
    y_range = 200
    plotstation()

    stname = "H4Y"
    zpos = 2173
    x_range = 200
    y_range = 200
    plotstation()

    #for sign in range(1,3):
        #signname = "positive" if (sign==1) else "negative"
#
#
        #events.Draw("y{0}+{1}*ty{0}:x{0}_st1+{1}*tx{0}_st1>>h(100,-150,150,400,-100,100)".format(sign,797),"","colz")
        #gDirectory.Get("h").SetTitle("{0} track extrapolated to DPSt1;X [cm];Y [cm]".format(signname))
        #c.Print(outfilename+".pdf");
#
        #events.Draw("y{0}+{1}*ty{0}:x{0}+{1}*tx{0}>>h(100,-150,150,400,-150,150)".format(sign,1403),"","colz")
        #gDirectory.Get("h").SetTitle("{0} track extrapolated to H2Y;X [cm];Y [cm]".format(signname))
        #c.Print(outfilename+".pdf");
#
        #events.Draw("y{0}+{1}*ty{0}:x{0}+{1}*tx{0}>>h(100,-150,150,400,-150,150)".format(sign,1497),"","colz")
        #gDirectory.Get("h").SetTitle("{0} track extrapolated to DPSt2;X [cm];Y [cm]".format(signname))
        #c.Print(outfilename+".pdf");
#
        #events.Draw("y{0}+{1}*ty{0}:x{0}+{1}*tx{0}>>h(100,-200,200,400,-200,200)".format(sign,2138),"","colz")
        #gDirectory.Get("h").SetTitle("{0} track extrapolated to H4Y1;X [cm];Y [cm]".format(signname))
        #c.Print(outfilename+".pdf");
#
        #events.Draw("y{0}+{1}*ty{0}:x{0}+{1}*tx{0}>>h(100,-200,200,400,-200,200)".format(sign,2208),"","colz")
        #gDirectory.Get("h").SetTitle("{0} track extrapolated to H4Y2;X [cm];Y [cm]".format(signname))
        #c.Print(outfilename+".pdf");


    #c.cd(1); events.Draw("{0}:{1}>>h1(100,-100,1000,100,-150,150)".format(y_st2[1],z_yzplane[1])," && ".join([trackqualitycut[0],fiducialcut[0],quadrantcut[0],acceptancecut[0],differentquadrantcut]),"colz")

c.Print(outfilename+".pdf]");

