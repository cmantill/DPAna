#!/usr/bin/env python
import sys
import math
from ROOT import gROOT, gStyle, TFile, TTree, TChain, TMVA, TCut, TCanvas, gDirectory, TH1, TGraph, gPad, TF1, THStack, TLegend
import getopt

gROOT.SetBatch(True)
datafile = TFile("datatuple.root")
dataevents = datafile.Get("save")

def makeskim(filename,cuts):
    outfile = TFile(filename,"RECREATE")
    outevents = dataevents.CopyTree(cuts)
    outevents.Write("save")
    outfile.Close()

#makeskim("displacedtracks.root","(x2<900 && -y2/ty2>450 && -y2/ty2<650) || (x1<900 && -y1/ty1>450 && -y1/ty1<650)")
#makeskim("displacedtracks.root","(x2<900 && -(y2-1.6)/ty2>450 && -(y2-1.6)/ty2<650) || (x1<900 && -(y1-1.6)/ty1>450 && -(y1-1.6)/ty1<650)")
makeskim("dimuons.root","x1<900 & x2<900 && (x1_st1+797*tx1_st1)*(x1+1497*tx1)>0 && (y1+797*ty1)*(y1+1497*ty1)>0 && (x2_st1+797*tx2_st1)*(x2+1497*tx2)>0 && (y2+797*ty2)*(y2+1497*ty2)>0")
makeskim("nim2.root","triggerBits>0 && (triggerBits & 64)!=0")
makeskim("nim3.root","triggerBits>0 && (triggerBits & 128)!=0")
