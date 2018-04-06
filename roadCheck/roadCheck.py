#!/usr/bin/env python
import sys
import math
from ROOT import gROOT, gStyle, TFile, TTree, TChain, TMVA, TCut, TCanvas, gDirectory, TH1, TGraph, gPad, TF1, THStack, TLegend
import getopt

gROOT.SetBatch(True)
gStyle.SetOptStat(111111)
gStyle.SetOptFit(1)
infile = TFile("merge.root")



outfilename="roadCheck"

c = TCanvas("c","c",1200,900);
c.Print(outfilename+".pdf[")

c.Divide(2,2)
for quad in range(0,4):
    hDP = infile.Get("fbCorrHist_{0}".format(quad))
    hDP.SetTitle("DP trigger;bar1;bar2")
    hNIM3 = infile.Get("fbCorrHistNIM3_{0}".format(quad))
    hNIM3.SetTitle("NIM3 trigger;bar1;bar2")
    c.cd(1)
    hDP.Draw("colz")
    c.cd(2)
    hNIM3.Draw("colz")
    c.cd(3)
    hDiv = hDP.Clone("hDiv_{0}".format(quad))
    hDiv.SetTitle("DP divided by NIM3")
    hDiv.Divide(hNIM3)
    hDiv.Draw("colz")
    c.Print(outfilename+".pdf");

    #c.cd(1); events.Draw("{0}:{1}>>h1(100,-100,1000,100,-150,150)".format(y_st2[1],z_yzplane[1])," && ".join([trackqualitycut[0],fiducialcut[0],quadrantcut[0],acceptancecut[0],differentquadrantcut]),"colz")

c.Print(outfilename+".pdf]");

