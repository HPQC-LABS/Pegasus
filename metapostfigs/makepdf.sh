#!/bin/bash

for f in fig*.eps; do ./a2ping.pl $f; done

pdfcrop --margins '0 0 -1000 -1000'       fig_Chimera1LL.pdf          fig_Chimera1LL_crop.pdf
pdfcrop --margins '-500 -500 -500 -500'   fig_Pegasus1LLone.pdf       fig_Pegasus1LLone_crop.pdf
pdfcrop --margins '0 0 -1000 -1000'       fig_Pegasus1LLfull.pdf      fig_Pegasus1LLfull_crop.pdf
pdfcrop --margins '0 0 -1000 -1000'       fig_Pegasus1LLfullblue.pdf  fig_Pegasus1LLfullblue_crop.pdf

pdfcrop --margins '0 0 -1000 -1000'       fig_Chimera2LL.pdf          fig_Chimera2LL_crop.pdf
pdfcrop --margins '-500 -500 -500 -500'   fig_Pegasus2LLone.pdf       fig_Pegasus2LLone_crop.pdf
pdfcrop --margins '0 0 -1000 -1000'       fig_Pegasus2LLfull.pdf      fig_Pegasus2LLfull_crop.pdf
pdfcrop --margins '0 0 -1000 -1000'       fig_Pegasus2LLfullblue.pdf  fig_Pegasus2LLfullblue_crop.pdf
