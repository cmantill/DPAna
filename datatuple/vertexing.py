#!/usr/bin/env python
import sys
import math
from ROOT import gROOT, gStyle, TFile, TTree, TChain, TMVA, TCut, TCanvas, gDirectory, TH1, TGraph, gPad, TF1, THStack, TLegend
import getopt

gROOT.SetBatch(True)
gStyle.SetOptStat(111111)
gStyle.SetOptFit(1)
allfile = TFile("loose_dimuons.root")
allevents = allfile.Get("save")
allevents.AddFriend("vtx","vtx_loose_dimuons.root")

outfilename="vertexing"

c = TCanvas("c","c",1200,900);
c.Print(outfilename+".pdf[")


#cuts = "tx1<900 && tx2<900 && vtx_dist<5 && vtx_z>500 && (2-y1)/ty1>400 && (2-y2)/ty2>400 && min(abs(ty1),abs(ty2))>0.01 && min(nHits1,nHits2)>=16 && (x1+1497*tx1)*(x2*1497*tx2)<0"
cuts = "tx1<900 && tx2<900 && vtx_dist<5 && vtx_z>500 && (2-y1)/ty1>400 && (2-y2)/ty2>400 && min(abs(ty1),abs(ty2))>0.01 && min(nHits1,nHits2)>=16"
vtx_proj_x = "vtx_x-vtx_z*(tx1_st1*pz1+tx2_st1*pz2)/(pz1+pz2)"
vtx_proj_y = "vtx_y-vtx_z*(ty1*pz1+ty2*pz2)/(pz1+pz2)"
mass = "((ty1-ty2)*(ty1-ty2)+(tx1_st1-tx2_st1)*(tx1_st1-tx2_st1))*pz1*pz2"
#save->Draw("((ty1-ty2)*(ty1-ty2)+(tx1_st1-tx2_st1)*(tx1_st1-tx2_st1))*pz1*pz2>>(100,0,10)","tx1<900 && tx2<900 && vtx_dist<5 && vtx_z>500 && (2-y1)/ty1>400 && (2-y2)/ty2>400 && min(abs(ty1),abs(ty2))>0.01 && min(nHits1,nHits2)>=16 && (x1+1497*tx1)*(x2*1497*tx2)<0","colz")
#save->Draw("vtx_x-vtx_z*(tx1_st1*pz1+tx2_st1*pz2)/(pz1+pz2):vtx_y-vtx_z*(ty1*pz1+ty2*pz2)/(pz1+pz2)>>(100,-50,50,100,-50,50)","tx1<900 && tx2<900 && vtx_dist<5 && vtx_z>500 && (2-y1)/ty1>400 && (2-y2)/ty2>400 && min(abs(ty1),abs(ty2))>0.01 && min(nHits1,nHits2)>=16 && (x1+1497*tx1)*(x2*1497*tx2)<0","colz")

allevents.Draw("{0}:{1}>>(100,-50,50,100,-50,50)".format(vtx_proj_y,vtx_proj_x),cuts,"colz")
c.Print(outfilename+".pdf")

allevents.Draw(mass+">>(20,0,10)",cuts,"colz")
c.Print(outfilename+".pdf")

c.Print(outfilename+".pdf]")


