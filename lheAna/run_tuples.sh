#!/bin/bash
while read mass yield
do
    echo $mass $yield
    for logeps in `seq -5.0 -0.2 -8.0`
    do
	echo ./bin/hepmc SeaQuest_MonteCarlo/SeaQuestAprimeToMuonsLHE_Brem_mAp_${mass}_GeV.txt brem_${mass}_${logeps}.root -c -C -z400 -Z650 -n2000 -E${logeps}
        #./bin/hepmc SeaQuest_MonteCarlo/SeaQuestAprimeToMuonsLHE_Brem_mAp_${mass}_GeV.txt brem_${mass}_${logeps}.root -c -C -z400 -Z650 -n2000 -E${logeps}
    done
done < brem_yields.txt

while read mass yield
do
    echo $mass $yield
    for logeps in `seq -5.0 -0.2 -8.0`
    do
	echo ./bin/hepmc SeaQuest_MonteCarlo/SeaQuestAprimeToMuonsLHE_Eta_mAp_${mass}_GeV.txt eta_${mass}_${logeps}.root -c -C -z400 -Z650 -n2000 -E${logeps}
        #./bin/hepmc SeaQuest_MonteCarlo/SeaQuestAprimeToMuonsLHE_Eta_mAp_${mass}_GeV.txt eta_${mass}_${logeps}.root -c -C -z400 -Z650 -n2000 -E${logeps}
    done
done < eta_yields.txt
