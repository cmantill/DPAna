#!/usr/bin/env python
import sys
import math
from ROOT import gROOT, gStyle, TFile, TTree, TChain, TMVA, TCut, TCanvas, gDirectory, TH1, TGraph, gPad, TF1, THStack, TLegend
import getopt

gROOT.SetBatch(True)
gStyle.SetOptStat(11)
gStyle.SetOptFit(1)
allfile = TFile("withproptuple.root")
allevents = allfile.Get("save")

outfilename="withprop"

c = TCanvas("c","c",1200,900);
c.Print(outfilename+".pdf[")


#cuts = "tx1<900 && tx2<900 && vtx_dist<5 && vtx_z>500 && (2-y1)/ty1>400 && (2-y2)/ty2>400 && min(abs(ty1),abs(ty2))>0.01 && min(nHits1,nHits2)>=16 && (x1+1497*tx1)*(x2*1497*tx2)<0"
#cuts = "tx1<900 && tx2<900 && vtx_dist<5 && vtx_z>500 && (2-y1)/ty1>400 && (2-y2)/ty2>400 && min(abs(ty1),abs(ty2))>0.01 && min(nHits1,nHits2)>=16"
#vtx_proj_x = "vtx_x-vtx_z*(tx1_st1*pz1+tx2_st1*pz2)/(pz1+pz2)"
#vtx_proj_y = "vtx_y-vtx_z*(ty1*pz1+ty2*pz2)/(pz1+pz2)"
#mass = "((ty1-ty2)*(ty1-ty2)+(tx1_st1-tx2_st1)*(tx1_st1-tx2_st1))*pz1*pz2"
#save->Draw("((ty1-ty2)*(ty1-ty2)+(tx1_st1-tx2_st1)*(tx1_st1-tx2_st1))*pz1*pz2>>(100,0,10)","tx1<900 && tx2<900 && vtx_dist<5 && vtx_z>500 && (2-y1)/ty1>400 && (2-y2)/ty2>400 && min(abs(ty1),abs(ty2))>0.01 && min(nHits1,nHits2)>=16 && (x1+1497*tx1)*(x2*1497*tx2)<0","colz")
#save->Draw("vtx_x-vtx_z*(tx1_st1*pz1+tx2_st1*pz2)/(pz1+pz2):vtx_y-vtx_z*(ty1*pz1+ty2*pz2)/(pz1+pz2)>>(100,-50,50,100,-50,50)","tx1<900 && tx2<900 && vtx_dist<5 && vtx_z>500 && (2-y1)/ty1>400 && (2-y2)/ty2>400 && min(abs(ty1),abs(ty2))>0.01 && min(nHits1,nHits2)>=16 && (x1+1497*tx1)*(x2*1497*tx2)<0","colz")

#triggerBits==64 && (x0+1497*tx)*(x0+2200*tx)>0 && (y0+797*ty)*(y0+2200*ty)>0 && abs(y0+797*ty)>7.5 && abs(y0+1497*ty)>7.5 && abs(y0+797*ty)<40
allevents.Draw("x0+1320*tx-0.26*(y0+1320*ty):tx>>(100,-0.3,0.3,2000,-120,120)","triggerBits==64","colz"); c.Print(outfilename+".pdf")

allevents.Draw("x0+1345*tx:tx>>(100,-0.3,0.3,2000,-120,120)","triggerBits==64","colz"); c.Print(outfilename+".pdf")

allevents.Draw("x0+1370*tx+0.26*(y0+1370*ty):tx>>(100,-0.3,0.3,2000,-120,120)","triggerBits==64","colz"); c.Print(outfilename+".pdf")

allevents.Draw("x0+1930*tx:tx>>(100,-0.3,0.3,2000,-120,120)","triggerBits==64&&nHits_st3a==4","colz"); c.Print(outfilename+".pdf")

allevents.Draw("ty:tx>>h(200,-0.3,0.3,200,-0.25,0.25)","triggerBits==64","colz")
gDirectory.Get("h").SetTitle("NIM2 triggers, St2-3-4 tracklets;tx;ty")
c.Print(outfilename+".pdf")

stHits = [23, 27, 29, 30, 31, 39, 43, 45, 46, 47, 53, 54, 55, 57, 58, 59, 61, 62, 63]
hitmasks = [3, 12, 48]
for i in stHits:
    print "{0}:{0:06b}".format(i)
    allevents.Draw("ty:tx>>h(200,-0.3,0.3,200,-0.25,0.25)","triggerBits==64&&st2Hits=={0}".format(i),"colz")
    gDirectory.Get("h").SetTitle("st2Hits={0} ({0:06b});tx;ty".format(i))
    c.Print(outfilename+".pdf")
for plane in range(0,3):
    for mask in range(1,4):
        allevents.Draw("ty:tx>>h(200,-0.3,0.3,200,-0.25,0.25)","triggerBits==64&&((st2Hits/{0})&3)=={1}".format(4**plane,mask),"colz")
        gDirectory.Get("h").SetTitle("st2Hits, plane {0}, mask {1};tx;ty".format(plane,mask))
        c.Print(outfilename+".pdf")
"""
for i in stHits:
    print "{0}:{0:06b}".format(i)
    allevents.Draw("ty:tx>>h(200,-0.3,0.3,200,-0.25,0.25)","triggerBits==64&&st3aHits=={0}".format(i),"colz")
    gDirectory.Get("h").SetTitle("st3aHits={0} ({0:06b});tx;ty".format(i))
    c.Print(outfilename+".pdf")
for i in stHits:
    print "{0}:{0:06b}".format(i)
    allevents.Draw("ty:tx>>h(200,-0.3,0.3,200,-0.25,0.25)","triggerBits==64&&st3bHits=={0}".format(i),"colz")
    gDirectory.Get("h").SetTitle("st3bHits={0} ({0:06b});tx;ty".format(i))
    c.Print(outfilename+".pdf")
"""
c.Print(outfilename+".pdf]")


