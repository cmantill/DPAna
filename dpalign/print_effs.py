#!/usr/bin/env python
import sys
from ROOT import gROOT, TFile, TCanvas

gROOT.SetBatch(True)
inFile = TFile(sys.argv[1])
c = TCanvas("c","c",800,1000)

outfilename="efficiency_quads"
c.Print(outfilename+".pdf[")
c.Divide(1,4)
c.cd(1)
inFile.Get("eff_St1_quad0").Draw()
c.cd(2)
inFile.Get("eff_St1_quad1").Draw()
c.cd(3)
inFile.Get("eff_St1_quad2").Draw()
c.cd(4)
inFile.Get("eff_St1_quad3").Draw()
c.cd()
c.Print(outfilename+".pdf")
c.cd(1)
inFile.Get("eff_St2_quad0").Draw()
c.cd(2)
inFile.Get("eff_St2_quad1").Draw()
c.cd(3)
inFile.Get("eff_St2_quad2").Draw()
c.cd(4)
inFile.Get("eff_St2_quad3").Draw()
c.cd()
c.Print(outfilename+".pdf")
c.Print(outfilename+".pdf]")
