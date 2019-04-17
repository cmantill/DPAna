#!/usr/bin/env python
import sys
import math
from ROOT import gROOT, gStyle, TFile, TTree, TChain, TMVA, TCut, TCanvas, gDirectory, TH1, TGraph, gPad, TF1, THStack, TLegend, TH2D
import getopt
import array

def drawContour(hist,nlevels,minValue=-1):
    #minValue = hist.GetBinContent(hist.GetMinimumBin())
    if minValue==-1:
        minValue = hist.GetMinimum(0)
    bottom = int(math.floor(math.log10(minValue)))
    limitLevels = array.array('d')
    for i in range(bottom,bottom+nlevels):
        for j in range(1,10):
            limitLevels.append((10**i)*j)
    hist.SetContour(len(limitLevels),limitLevels)
    hist.GetXaxis().SetMoreLogLabels()
    hist.GetXaxis().SetTitle("mass [GeV]")
    hist.GetYaxis().SetTitle("epsilon^2")
    hist.Draw("cont1z")
    hist.GetZaxis().SetRangeUser(10**bottom,10**(bottom+nlevels))
def drawMaxContour(hist,nlevels):
    maxValue = hist.GetBinContent(hist.GetMaximumBin())
    bottom = int(math.floor(math.log10(maxValue)))-nlevels+1
    limitLevels = array.array('d')
    for i in range(bottom,bottom+nlevels):
        for j in range(1,10):
            limitLevels.append((10**i)*j)
    hist.SetContour(len(limitLevels),limitLevels)
    hist.GetXaxis().SetMoreLogLabels()
    hist.GetXaxis().SetTitle("mass [GeV]")
    hist.GetYaxis().SetTitle("epsilon^2")
    hist.Draw("cont1z")
    hist.GetZaxis().SetRangeUser(10**bottom,10**(bottom+nlevels))
def drawHist(hist,nlevels,minz,maxz):
    hist.SetContour(nlevels)
    hist.Draw("colz")
    hist.GetXaxis().SetMoreLogLabels()
    hist.GetXaxis().SetTitle("mass [GeV]")
    hist.GetYaxis().SetTitle("epsilon^2")
    hist.GetZaxis().SetRangeUser(minz,maxz)

gROOT.SetBatch(True)
gStyle.SetOptStat(0)
gStyle.SetOptFit(1)

c = TCanvas("c","c",800,600);
c.Print("reach.pdf[")
outfile = TFile("reach.root","RECREATE")
c.SetLogx(1)
c.SetLogy(1)
c.SetLogz(1)

n_repeat = 10000

n_epsbins = 16
minlogeps = -8.0
logepsstep = 0.2
n_massbins = 29
minmass = 0.25
massstep = 0.10
xedges = array.array('d')
yedges = array.array('d')
for i in range(0,n_massbins+1):
    xedges.append(minmass+(i-0.5)*massstep)
for j in range(0,n_epsbins+1):
    yedges.append(10**(minlogeps+(j-0.5)*logepsstep))

trackableHist=TH2D("trackable_brem","trackable_brem",n_massbins,xedges,n_epsbins,yedges)
outfile.Add(trackableHist)
detectableHist=TH2D("detectable_brem","detectable_brem",n_massbins,xedges,n_epsbins,yedges)
outfile.Add(detectableHist)

epslist = [minlogeps+logepsstep*x for x in range(0,n_epsbins)]

with open('brem_yields.txt') as yieldfile:
    for line in yieldfile:
        [massstr, muyieldstr] = line.split()
        mass = float(massstr)
        muyield = float(muyieldstr)

        for logeps in epslist:
            rootfile = TFile("brem_{0}_{1}.root".format(mass,logeps))
            n_events = rootfile.Get("vz_trg").Integral()
            production = 1e18*n_events*muyield*(10**(2*logeps))/n_repeat
            detectableHist.Fill(mass,10**logeps,production)
            n_events = rootfile.Get("vz_trk").Integral()
            production = 1e18*n_events*muyield*(10**(2*logeps))/n_repeat
            trackableHist.Fill(mass,10**logeps,production)
            #if production>1:
            #    print mass, muyield, logeps, n_events, 10**logeps, production
            rootfile.Close()

drawContour(detectableHist,3,0.1)
c.Print("reach.pdf")
drawContour(trackableHist,3,0.1)
c.Print("reach.pdf")
#outfile.Write()

n_epsbins = 16
minlogeps = -8.0
logepsstep = 0.2
n_massbins = 15
minmass = 0.25
massstep = 0.02
xedges = array.array('d')
yedges = array.array('d')
for i in range(0,n_massbins+1):
    xedges.append(minmass+(i-0.5)*massstep)
for j in range(0,n_epsbins+1):
    yedges.append(10**(minlogeps+(j-0.5)*logepsstep))

detectableHist=TH2D("detectable_eta","detectable_eta",n_massbins,xedges,n_epsbins,yedges)
outfile.Add(detectableHist)
print detectableHist

with open('eta_yields.txt') as yieldfile:
    for line in yieldfile:
        [massstr, muyieldstr] = line.split()
        mass = float(massstr)
        muyield = float(muyieldstr)

        for logeps in epslist:
            rootfile = TFile("eta_{0}_{1}.root".format(mass,logeps))
            n_events = rootfile.Get("vz_trg").Integral()
            production = 1e18*n_events*muyield*(10**(2*logeps))
            detectableHist.Fill(mass,10**logeps,production)
            if production>1:
                print mass, muyield, logeps, n_events, 10**logeps, production
            rootfile.Close()

drawContour(detectableHist,3,0.1)
drawHist(detectableHist,30,0.1,100)
c.Print("reach.pdf")
c.Print("reach.pdf]")
outfile.Write()
outfile.Close()
