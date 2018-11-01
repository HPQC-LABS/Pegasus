#!/bin/bash

for f in fig*.eps; do ./a2ping.pl $f; done

pdfcrop --margins '0 0 -200 -280'	fig_ChimeraDmdRect3x3.pdf		fig_ChimeraDmdRect3x3_crop.pdf
pdfcrop --margins '-140 -200 -140 -200'	fig_PegasusDmdRect3x3one.pdf		fig_PegasusDmdRect3x3one_crop.pdf
pdfcrop --margins '0 0 -220 -320'	fig_PegasusDmdRect3x3full.pdf		fig_PegasusDmdRect3x3full_crop.pdf
pdfcrop --margins '0 0 -220 -320'	fig_PegasusDmdRect3x3fullblue.pdf	fig_PegasusDmdRect3x3fullblue_crop.pdf

pdfcrop --margins '0 0 -280 -280'	fig_ChimeraStdRect3x3.pdf		fig_ChimeraStdRect3x3_crop.pdf
pdfcrop --margins '-200 -200 -200 -200'	fig_PegasusStdRect3x3one.pdf		fig_PegasusStdRect3x3one_crop.pdf
pdfcrop --margins '0 0 -320 -340'	fig_PegasusStdRect3x3full.pdf		fig_PegasusStdRect3x3full_crop.pdf
pdfcrop --margins '0 0 -320 -340'	fig_PegasusStdRect3x3fullblue.pdf	fig_PegasusStdRect3x3fullblue_crop.pdf

pdfcrop --margins '0 0 -200 -320'	fig_ChimeraDmdTilt3x3.pdf		fig_ChimeraDmdTilt3x3_crop.pdf
pdfcrop --margins '-140 -240 -140 -240'	fig_PegasusDmdTilt3x3one.pdf		fig_PegasusDmdTilt3x3one_crop.pdf
pdfcrop --margins '0 0 -220 -320'	fig_PegasusDmdTilt3x3full.pdf		fig_PegasusDmdTilt3x3full_crop.pdf
pdfcrop --margins '0 0 -220 -320'	fig_PegasusDmdTilt3x3fullblue.pdf	fig_PegasusDmdTilt3x3fullblue_crop.pdf


pdfcrop --margins '0 0 -240 -320'	fig_ChimeraStdTilt3x3.pdf		fig_ChimeraStdTilt3x3_crop.pdf
pdfcrop --margins '-200 -260 -200 -260'	fig_PegasusStdTilt3x3one.pdf		fig_PegasusStdTilt3x3one_crop.pdf
pdfcrop --margins '0 0 -330 -320'	fig_PegasusStdTilt3x3full.pdf		fig_PegasusStdTilt3x3full_crop.pdf
pdfcrop --margins '0 0 -330 -320'	fig_PegasusStdTilt3x3fullblue.pdf	fig_PegasusStdTilt3x3fullblue_crop.pdf

