#!/usr/bin/env python
import sys
import math
from ROOT import gROOT, gStyle, TFile, TTree, TChain, TMVA, TCut, TCanvas, gDirectory, TH1, TGraph, gPad, TF1, THStack, TLegend, TH2D
import getopt

gROOT.SetBatch(True)
gStyle.SetOptStat(11)
#gStyle.SetOptFit(1)
infile = TFile("roadCheck_data.root")
infilepre = TFile("roadCheck_predata.root")
#infile = TFile("roadCheck_test.root")

outfilename="timeOffset"

c = TCanvas("c","c",1200,900);
c.Print(outfilename+".pdf[")


htrig = infile.Get("roadsVsTrig")
hquadsH4NIM1 = htrig.ProjectionY("quadsH4NIM1",33,33)
trigsNIM1 = hquadsH4NIM1.Integral()
hquadsH4DP = htrig.ProjectionY("quadsH4DP",65,65)
trigsDP = hquadsH4DP.Integral()
hquadsH4NIM3 = htrig.ProjectionY("quadsH4NIM3",129,129)
trigsNIM3 = hquadsH4NIM3.Integral()

hrawtimes = infile.Get("rawTimeHists")
#hrawtimes.Scale(1000.0/trigsDP)
hrawtimesNIM1 = infile.Get("rawTimeHistsNIM1")
hrawtimes_predata = infilepre.Get("rawTimeHists")
#hrawtimesNIM1.Scale(1000.0/trigsNIM1)
hDCtimes = hrawtimes.ProjectionX("DCtimes",20,25)
hDCtimesNIM1 = hrawtimesNIM1.ProjectionX("DCtimesNIM1",20,25)
hDCtimes_predata = hrawtimes_predata.ProjectionX("DCtimes_pre",20,25)

c.Divide(1,3)

c.cd(1)
hrawtimes.Draw("colz")
hrawtimes.SetTitle("raw times, DP data;TDC time [ns];detectorID")
c.cd(2)
hrawtimesNIM1.Draw("colz")
hrawtimesNIM1.SetTitle("raw times, NIM1 data;TDC time [ns];detectorID")
c.cd(3)
hrawtimes_predata.Draw("colz")
hrawtimes_predata.SetTitle("raw times, DP predata;TDC time [ns];detectorID")
c.cd()
c.Print(outfilename+".pdf");

c.Clear()
c.Divide(1,5)

shiftBy = 8*8
shiftTime = shiftBy*18.8/8

c.cd(1)
hDCtimes.Draw("HIST")
hDCtimes.GetXaxis().SetRangeUser(1270,1820)

c.cd(2)
hDCtimesNIM1.Draw("HIST")
hDCtimesNIM1.GetXaxis().SetRangeUser(1270-shiftTime,1820-shiftTime)

c.cd(4)
hDCtimes_predata.Draw("HIST")
hDCtimes_predata.GetXaxis().SetRangeUser(1270-shiftTime,1820-shiftTime)

nbins_integral = hDCtimes_predata.GetXaxis().FindBin(1620)-hDCtimes_predata.GetXaxis().FindBin(1580) #use the same number of bins for each integral, corresponds to roughly 40 ns

bkgd_data = hDCtimes.Integral(hDCtimes.GetXaxis().FindBin(1320), hDCtimes.GetXaxis().FindBin(1320)+nbins_integral)
peak_data = hDCtimes.Integral(hDCtimes.GetXaxis().FindBin(1620)-nbins_integral, hDCtimes.GetXaxis().FindBin(1620))
bkgd_predata = hDCtimes_predata.Integral(hDCtimes_predata.GetXaxis().FindBin(1620)-nbins_integral, hDCtimes_predata.GetXaxis().FindBin(1620))
peak_predata = hDCtimes_predata.Integral(hDCtimes_predata.GetXaxis().FindBin(1620)-shiftBy, hDCtimes_predata.GetXaxis().FindBin(1620)-shiftBy+nbins_integral)
bkgd_NIM1 = hDCtimesNIM1.Integral(hDCtimesNIM1.GetXaxis().FindBin(1620)-nbins_integral, hDCtimesNIM1.GetXaxis().FindBin(1620))
peak_NIM1 = hDCtimesNIM1.Integral(hDCtimesNIM1.GetXaxis().FindBin(1620)-shiftBy, hDCtimesNIM1.GetXaxis().FindBin(1620)-shiftBy+nbins_integral)

scalefactor = (peak_predata-bkgd_predata)/(peak_data-bkgd_data)
bkgd_offset = (bkgd_predata/scalefactor - bkgd_data)/nbins_integral
scalefactorNIM1 = (peak_NIM1-bkgd_NIM1)/(peak_data-bkgd_data)
bkgd_offsetNIM1 = (bkgd_NIM1/scalefactorNIM1 - bkgd_data)/nbins_integral
print bkgd_predata, bkgd_data, peak_predata, peak_data, scalefactor, bkgd_offset
hDCtimes_shift = hDCtimes.Clone()
hDCtimesNIM1_shift = hDCtimesNIM1.Clone()
nbins = hDCtimes.GetNbinsX()
for i in range(1,nbins+1):
    if (i+shiftBy>0 and i+shiftBy<=nbins):
        #hDCtimes_shift.SetBinContent(i,hDCtimes_shift.GetBinContent(i+shiftBy))
        hDCtimes_shift.SetBinContent(i,hDCtimes.GetBinContent(i+shiftBy)+bkgd_offset)
        hDCtimesNIM1_shift.SetBinContent(i,hDCtimes.GetBinContent(i+shiftBy)+bkgd_offsetNIM1)
    else:
        hDCtimes_shift.SetBinContent(i,0)
        hDCtimesNIM1_shift.SetBinContent(i,0)
hDCtimes_shift.SetBinContent(0,0)
hDCtimes_shift.SetBinContent(nbins+1,0)
hDCtimes_shift.Scale(scalefactor)
hDCtimesNIM1_shift.SetBinContent(0,0)
hDCtimesNIM1_shift.SetBinContent(nbins+1,0)
hDCtimesNIM1_shift.Scale(scalefactorNIM1)
c.cd(3)
hDCtimesNIM1_shift.SetLineColor(2)
hDCtimesNIM1_shift.Draw("HIST")
hDCtimesNIM1_shift.GetXaxis().SetRangeUser(1100,1650)
hDCtimesNIM1.Draw("HIST SAME")
c.cd(5)
hDCtimes_shift.SetLineColor(2)
hDCtimes_shift.Draw("HIST")
hDCtimes_shift.GetXaxis().SetRangeUser(1100,1650)
hDCtimes_predata.Draw("HIST SAME")


#hDCtimesNIM1.Draw("HIST SAME")


c.cd()
c.Print(outfilename+".pdf");

c.Print(outfilename+".pdf]");

