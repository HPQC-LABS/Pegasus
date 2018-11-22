#!/bin/bash

for f in fig*.eps; do ./a2ping.pl $f; done

pdfcrop --margins '-420 -300 -880 -680'	fig_ChimeraDmdRect5x5.pdf		fig_ChimeraDmdRect5x5_crop.pdf
pdfcrop --margins '-420 -300 -420 -300'	fig_PegasusDmdRect5x5one.pdf		fig_PegasusDmdRect5x5one_crop.pdf
pdfcrop --margins '-420 -300 -880 -680'	fig_PegasusDmdRect5x5full.pdf		fig_PegasusDmdRect5x5full_crop.pdf
pdfcrop --margins '-420 -300 -880 -680'	fig_PegasusDmdRect5x5fullblue.pdf	fig_PegasusDmdRect5x5fullblue_crop.pdf

pdfcrop --margins '-320 -380 -680 -800'	fig_ChimeraStdRect5x5.pdf		fig_ChimeraStdRect5x5_crop.pdf
pdfcrop --margins '-320 -380 -320 -380'	fig_PegasusStdRect5x5one.pdf		fig_PegasusStdRect5x5one_crop.pdf
pdfcrop --margins '-320 -380 -680 -800'	fig_PegasusStdRect5x5full.pdf		fig_PegasusStdRect5x5full_crop.pdf
pdfcrop --margins '-320 -380 -680 -800'	fig_PegasusStdRect5x5fullblue.pdf	fig_PegasusStdRect5x5fullblue_crop.pdf

pdfcrop --margins '-420 -380 -880 -780'	fig_ChimeraDmdTilt5x5.pdf		fig_ChimeraDmdTilt5x5_crop.pdf
pdfcrop --margins '-420 -380 -420 -380'	fig_PegasusDmdTilt5x5one.pdf		fig_PegasusDmdTilt5x5one_crop.pdf
pdfcrop --margins '-420 -380 -880 -780'	fig_PegasusDmdTilt5x5full.pdf		fig_PegasusDmdTilt5x5full_crop.pdf
pdfcrop --margins '-420 -380 -880 -780'	fig_PegasusDmdTilt5x5fullblue.pdf	fig_PegasusDmdTilt5x5fullblue_crop.pdf

pdfcrop --margins '-320 -460 -680 -960'	fig_ChimeraStdTilt5x5.pdf		fig_ChimeraStdTilt5x5_crop.pdf
pdfcrop --margins '-320 -500 -320 -500'	fig_PegasusStdTilt5x5one.pdf		fig_PegasusStdTilt5x5one_crop.pdf
pdfcrop --margins '-320 -460 -680 -960'	fig_PegasusStdTilt5x5full.pdf		fig_PegasusStdTilt5x5full_crop.pdf
pdfcrop --margins '-320 -460 -680 -960'	fig_PegasusStdTilt5x5fullblue.pdf	fig_PegasusStdTilt5x5fullblue_crop.pdf

