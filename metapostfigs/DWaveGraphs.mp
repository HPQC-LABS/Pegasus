% DWaveGraphs.mp -- drawing the Chimera and the Pegasus graphs.
% Szilárd Szalay, Wigner Research Centre for Physics, Budapest.
%
% MetaPost: 
%   https://tug.org/metapost.html
%   https://tug.org/docs/metapost/mpman.pdf
%
% compiling:
% simple compiling: 
%   mpost DWaveGraphs.mp
% for converting .eps files to .pdf, use the shell command
%   for f in fig_*.eps; do a2ping $f; done
%   OR
%   for f in fig_*.eps; do epspdf $f; done


% ** declarations for metaposting **********************************************
prologues := 3;	% needed if there are LaTeX labels and also for converting to pdf

% for writing out the indices:
numeric showindices;
showindices := 0;	% hide the indices
%showindices := 1;	% show the indices

if showindices=1:
	input TEX;
	TEXPRE("%&latex" & char(10) & "\documentclass{article}\begin{document}");
	TEXPOST("\end{document}");
fi;

% ** color definitions *********************************************************
color cblack;	cblack := ( 0*16+ 0, 0*16+ 0, 0*16+ 0)/256;	% hsv:   0,  0,  0
color cgrey;	cgrey  := (13*16+ 0,13*16+ 0,13*16+ 0)/256;	% hsv:   
%color cred;	cred   := (15*16+15, 3*16+ 6, 3*16+ 6)/256;	% hsv:   0, 79,100
color cred;	cred   := (       1,       0,       0)    ;	% hsv:   
color clblue; 	clblue := ( 180    , 206    , 256    )/256;     % hsv: 
%color cblue;	cblue  := ( 8*16+ 4, 8*16+ 4,15*16+15)/256;     % hsv: 240, 22, 67
color cblue;	cblue  := (       0,       0,       1)    ;     % hsv: 
%color cdblue;	cdblue := ( 45     , 98     ,     255)/256;     % hsv: 
color cdblue;	cdblue := .4cblue + .6clblue;
color cgreeno;	cgreeno:= ( 9*16+10,15*16+15, 9*16+10)/256;	% hsv: 120, 40,100
color cgreen ;	cgreen := (       0,    0.95,       0)    ;	% hsv: 

color cgreen;	cgreen := ( 0*16+ 0, 9*16+10, 4*16+ 2)/256;	% hsv: 146,100, 60
%color corange;	corange:= (15*16+15, 9*16+15, 0*16+ 0)/256;	% hsv:  37,100,100
color corange;	corange:= (       1,     0.5,       0)    ;	% hsv:  37,100,100

% ** units *********************************************************************

numeric L;	% size of the Chimera blocks, $L\times L$
L := 5;

string innermode;			% type of unit cells:
innermode := "Trp";			%   trapezoid
%innermode := "Dmd";			%   diamond
%innermode := "Std";			%   2x4
%innermode := "Dot";			%   one dot

string outermode;			% type of layer:
%outermode := "Rect";			%   rectangular, one behind the other
outermode := "Tilt";			%   parallelogram, one behind the other
% not implemented yet:
%outermode := "Stck";			%   parallelogram, stacked one on top of the other

numeric chimeraonly; chimeraonly := 0;

numeric ut, vt, dlt, urt, sfh; 
numeric th, tv, tlh, tlv;

numeric dbblone,dbbtone,dbbrone,dbbbone;
numeric dbblfull,dbbtfull,dbbrfull,dbbbfull;

% these can be merged later, if the parameters become "fixed"
if (innermode="Trp") and (outermode="Rect"):
	ut  := 24bp;			% base unit (general, and for unit cells)
	vt  := 4.5ut;			% base unit (for graph)
	dlt := 3.25vt;			% horizontal=vertical steps for layers
	urt := 0;			% rotation of the unit cell
	sfh := 1.0;			% horizontal scale factor
	dbblone := vt-1.5ut;
	dbbtone := vt-2.25ut;
	dbbrone := vt-2.25ut;
	dbbbone := vt-1.5ut;
%	dbblone := vt+.5ut;
%	dbbtone := vt+.5ut;
%	dbbrone := vt+.5ut;
%	dbbbone := vt+.5ut;
	dbblfull := -.5ut;
	dbbtfull := -.5ut;
	dbbrfull := -.5ut;
	dbbbfull := -.5ut;
elseif (innermode="Dmd") and (outermode="Rect"):
	ut  := 24bp;			% base unit (general, and for unit cells)
	vt  := 4.5ut;			% base unit (for graph)
	dlt := 3.25vt;			% horizontal=vertical steps for layers
	urt := 0;			% rotation of the unit cell
	sfh := 1.0;			% horizontal scale factor
	dbblone := vt-1.5ut;
	dbbtone := vt-1.5ut;
	dbbrone := vt-1.5ut;
	dbbbone := vt-1.5ut;
	dbblfull := -.5ut;
	dbbtfull := -.5ut;
	dbbrfull := -.5ut;
	dbbbfull := -.5ut;
elseif (innermode="Std") and (outermode="Rect"):
	ut  := 24bp;			% base unit (general, and for unit cells)
	vt  := 4.5ut;			% base unit (for graph)
	dlt := 3.25vt;			% horizontal=vertical steps for layers
	th  :=-0.70;      		% horizontal tilt factor of the unit cell
	tv  :=+0.25;			% vertical tilt factor of the unit cell
	sfh := 1.0;			% horizontal scale factor
	dbblone := vt+.5ut;
	dbbtone := vt+.5ut;
	dbbrone := vt+.5ut;
	dbbbone := vt+.5ut;
	dbblfull := -.5ut;
	dbbtfull := -.5ut;
	dbbrfull := -.5ut;
	dbbbfull := -.5ut;
elseif (innermode="Dot") and (outermode="Rect"):
	ut  := 6bp;			% base unit (general, and for unit cells)
	vt  := 4.5ut;			% base unit (for graph)
	dlt := 3.25vt;			% horizontal=vertical steps for layers
	sfh := 1.0;			% horizontal scale factor
	dbblone := vt+.5ut;
	dbbtone := vt+.5ut;
	dbbrone := vt+.5ut;
	dbbbone := vt+.5ut;
	dbblfull := -.5ut;
	dbbtfull := -.5ut;
	dbbrfull := -.5ut;
	dbbbfull := -.5ut;
elseif (innermode="Trp") and (outermode="Tilt"):
	ut  := 24bp;			% base unit (general, and for unit cells)
	vt  := 4.5ut;			% base unit (for graph)
	dlt := 3.45vt;			% horizontal=vertical steps for layers
	urt := 0;			% rotation of the unit cell
	sfh := 1;			% horizontal scale factor
	tlh := 0.00;			% horizontal tilt factor of the layer
	tlv :=-0.15;			% vertical tilt factor of the layer
	dbblone := vt-1.00ut;
	dbbtone := vt-3.00ut;
	dbbrone := vt-1.50ut;
	dbbbone := vt-1.75ut;
	dbblfull := -.5ut;
	dbbtfull := -1.5ut;
	dbbrfull := -.5ut;
	dbbbfull := -1.5ut;
elseif (innermode="Dmd") and (outermode="Tilt"):
	ut  := 24bp;			% base unit (general, and for unit cells)
	vt  := 4.5ut;			% base unit (for graph)
	dlt := 3.45vt;			% horizontal=vertical steps for layers
	urt := 0;			% rotation of the unit cell
	sfh := 1.0;			% horizontal scale factor
	tlh := 0.00;			% horizontal tilt factor of the layer
	tlv :=-0.15;			% vertical tilt factor of the layer
	dbblone := vt-1.00ut;
	dbbtone := vt-2.00ut;
	dbbrone := vt-1.00ut;
	dbbbone := vt-2.00ut;
	dbblfull := -.5ut;
	dbbtfull := -1.5ut;
	dbbrfull := -.5ut;
	dbbbfull := -1.5ut;
elseif (innermode="Std") and (outermode="Tilt"):
	ut  := 24bp;			% base unit (general, and for unit cells)
	vt  := 4.0ut;			% base unit (for graph)
	dlt := 3.45vt;			% horizontal=vertical steps for layers
	sfh := 1.0;			% horizontal scale factor
	th  :=-0.75;      		% horizontal tilt factor of the unit cell
	tv  :=+0.25;			% vertical tilt factor of the unit cell
	tlh := 0.00;			% horizontal tilt factor of the layer
	tlv :=-0.15;			% vertical tilt factor of the layer
	dbblone := vt+1.5ut;
	dbbtone := vt+0.25ut;
	dbbrone := vt+1.5ut;
	dbbbone := vt+0.25ut;
	dbblfull := -.5ut;
	dbbtfull := -1.5ut;
	dbbrfull := -.5ut;
	dbbbfull := -1.5ut;
elseif (innermode="Dot") and (outermode="Tilt"):
	ut  := 6bp;			% base unit (general, and for unit cells)
	vt  := 4.5ut;			% base unit (for graph)
	dlt := 3.45vt;			% horizontal=vertical steps for layers
	sfh := 1;			% horizontal scale factor
	tlh := 0.00;			% horizontal tilt factor of the layer
	tlv :=-0.15;			% vertical tilt factor of the layer
	dbblone := vt+.5ut;
	dbbtone := vt+.5ut;
	dbbrone := vt+.5ut;
	dbbbone := vt+.5ut;
	dbblfull := -0.5ut;
	dbbtfull := -1.5ut;
	dbbrfull := -0.5ut;
	dbbbfull := -1.5ut;
elseif outermode="Stck":	% to be implemented
	show "not implemented yet";
fi;

numeric dt; dt := .25ut;		% size of a vertex
numeric it; it := 1.0bp; % 0.7bp	% width of an edge

% ** drawing routines **********************************************************

% default vertex
vardef grvertex(expr A) =
	if innermode<>"Dot":
		draw A withpen pencircle scaled dt;
	else:
%		draw A withpen pencircle scaled 4dt;
		fill (-2dt,-2dt)--(-2dt,+2dt)--(+2dt,+2dt)--(+2dt,-2dt)--cycle shifted A withcolor black;
	fi;
enddef;

% default edge for the graph
vardef gredge(expr A,B,clr,emode) =
	if emode = "continuous":
		draw A--B withpen pencircle scaled it withcolor clr;
	elseif emode = "dashed":
		draw A--B withpen pencircle scaled it dashed evenly withcolor clr;
	elseif emode = "dotted":
		draw A--B withpen pencircle scaled it dashed withdots withcolor clr;
	fi;
enddef;

% ** definition of the vertex positions ***************************************

% calculates the coordinates of unit cells,
vardef PVouter(expr c,i,j) =
numeric dij; dij := if chimeraonly=1: dlt/3; else: dlt; fi;
	if chimeraonly<>1:
	+ c*(sfh*vt,vt)			% c: index of the Chimera layers
	fi
	+ i*(sfh*dij,0)			% i: horizontal index of the unit cells
	+ j*(0,dij)			% j: vertical index of the unit cells
	if outermode="Tilt":
	+ (j*sfh*tlh*dij,i*tlv*dij)		% tilting of the lattice
	fi
enddef;

% calculates the coordinates of vertices inside unit cells,
vardef PVinner(expr u,p,q) =
numeric pq; pq := 2*p+q;		% unit-cell coordinate
numeric pqb; pqb := pq-1.5;		% balanced unit-cell coordinate
numeric ub; ub := u-0.5;		% balanced unit-cell coordinate
	if innermode="Dmd":
		+ pqb*(-(1-u),-u)*ut rotated urt		% u: vertical or horizontal
	elseif innermode="Trp":
		((pq+0.75)*(-(1-u),-sfh*u)*ut +3.75/2*(1,1)*ut) rotated urt
	elseif innermode="Std":
		+ ub*(2.0ut,0)			% u: horizontal index of the vertices inside the unit cells
		+ pqb*(0,1.0ut)			% 2*p+q: vertical index of the vertices inside the unit cells
		+ ( pqb*th*ut, (-1)**u*tv*ut )	% tilting of the unit cells
	elseif innermode="Dot":
		(0,0)	
	fi
enddef;

% calculates the absolute coordinates of vertices,
vardef PV(expr c,i,j,u,p,q) =
	PVouter(c,i,j) + PVinner(u,p,q)
enddef;


% ** Graph definitions ********************************************************

% drawing edges defined by the equations, for given unit cell coordinates c,i,j
% based on the .pdf dated Nov 26, 2018 > no, that is corrected
vardef edgeeq(expr eq, c,i,j,clr,emode) =
pair pici; pici:=1it*dir(-45);


if innermode<>"Dot":

	if eq = "Chimera_K44":		% equation (12): K_{4,4} edges in unit cells
					for p = 0 upto 1:
					for pp = 0 upto 1:
						for q = 0 upto 1:
						for qp = 0 upto 1:
							gredge( PV(c,i,j,0,p,q), PV(c,i,j,1,pp,qp), clr, emode ); 
						endfor;
						endfor;
					endfor;
					endfor;
	elseif eq = "Chimera_Vertical":	% equation (13): vertical couplings
					for p = 0 upto 1:
						for q = 0 upto 1:
							gredge( PV(c,i,j,0,p,q), PV(c,i,j+1,0,p,q), clr, emode ); 
						endfor;
					endfor;
	elseif eq = "Chimera_Horizontal":	% equation (14): horizontal couplings
					for p = 0 upto 1:
						for q = 0 upto 1:
							gredge( PV(c,i,j,1,p,q), PV(c,i+1,j,1,p,q), clr, emode ); 
						endfor;
					endfor;
	elseif eq = "Pegasus_UC":	% equation (1): additional edges in unit cells
				for u = 0 upto 1:
					for p = 0 upto 1:
							gredge( PV(c,i,j,u,p,0), PV(c,i,j,u,p,1), clr, emode ); 
					endfor;
				endfor;


	elseif eq = "Pegasus_c01_ij_u0":	% equation (2) for u=0 (valid for c=0,1)
					for pp = 0 upto 1:
						for q = 0 upto 1:
						for qp = 0 upto 1:
							gredge( PV(c,i,j,0,0,q), PV((c+1)mod3,i,j,1,pp,qp), clr, emode ); 
						endfor;
						endfor;
					endfor;
	elseif eq = "Pegasus_c01_ij_u1":	% equation (2) for u=1 (valid for c=0,1)
					for pp = 0 upto 1:
						for q = 0 upto 1:
						for qp = 0 upto 1:
							gredge( PV(c,i,j,1,0,q), PV((c+1)mod3,i,j,0,pp,qp), clr, emode ); 
						endfor;
						endfor;
					endfor;
	elseif eq = "Pegasus_c01_ijm1_u1":	% equation (3) (valid for c=0,1)
					for pp = 0 upto 1:
						for q = 0 upto 1:
						for qp = 0 upto 1:
							gredge( PV(c,i,j,1,1,q), PV((c+1)mod3,i,j-1,0,pp,qp), clr, emode );
						endfor;
						endfor;
					endfor;
	elseif eq = "Pegasus_c01_im1j_u0":	% equation (4) (valid for c=0,1)
					for pp = 0 upto 1:
						for q = 0 upto 1:
						for qp = 0 upto 1:
							gredge( PV(c,i,j,0,1,q), PV((c+1)mod3,i-1,j,1,pp,qp), clr, emode ); 
						endfor;
						endfor;
					endfor;


	elseif eq = "Pegasus_c2_ip1jp1_u0":	% equation (5) for u=0 (valid for c=2, hardcoded)
					for pp = 0 upto 1:
						for q = 0 upto 1:
						for qp = 0 upto 1:
							gredge( PV(2,i,j,0,0,q), PV(0,i+1,j+1,1,pp,qp), clr, emode ); 
						endfor;
						endfor;
					endfor;
	elseif eq = "Pegasus_c2_ip1jp1_u1":	% equation (5) for u=1 (valid for c=2, hardcoded)
					for pp = 0 upto 1:
						for q = 0 upto 1:
						for qp = 0 upto 1:
							gredge( PV(2,i,j,1,0,q), PV(0,i+1,j+1,0,pp,qp), clr, emode ); 
						endfor;
						endfor;
					endfor;
	elseif eq = "Pegasus_c2_ijp1_u0":	% equation (6) (valid for c=2, hardcoded)
					for pp = 0 upto 1:
						for q = 0 upto 1:
						for qp = 0 upto 1:
							gredge( PV(2,i,j,0,1,q), PV(0,i,j+1,1,pp,qp), clr, emode );
						endfor;
						endfor;
					endfor;
	elseif eq = "Pegasus_c2_ip1j_u1":	% equation (7) (valid for c=2, hardcoded)
					for pp = 0 upto 1:
						for q = 0 upto 1:
						for qp = 0 upto 1:
							gredge( PV(2,i,j,1,1,q), PV(0,i+1,j,0,pp,qp), clr, emode ); 
						endfor;
						endfor;
					endfor;
	fi;

else:

	if eq = "Chimera_Vertical":		% equation (13): vertical couplings
							gredge( PVouter(c,i,j), PVouter(c,i,j+1), clr, emode ); 
	elseif eq = "Chimera_Horizontal":	% equation (14): horizontal couplings
							gredge( PVouter(c,i,j), PVouter(c,i+1,j), clr, emode ); 
	elseif eq = "Pegasus_c01_ij_u0":	% equation (2) for u=0 (valid for c=0,1)
							gredge( PVouter(c,i,j)-pici, PVouter((c+1)mod3,i,j)-pici, clr, emode ); 
	elseif eq = "Pegasus_c01_ij_u1":	% equation (2) for u=1 (valid for c=0,1)
							gredge( PVouter(c,i,j)+pici, PVouter((c+1)mod3,i,j)+pici, clr, emode ); 
	elseif eq = "Pegasus_c01_ijm1_u1":	% equation (3) (valid for c=0,1)
							gredge( PVouter(c,i,j), PVouter((c+1)mod3,i,j-1), clr, emode );
	elseif eq = "Pegasus_c01_im1j_u0":	% equation (4) (valid for c=0,1)
							gredge( PVouter(c,i,j), PVouter((c+1)mod3,i-1,j), clr, emode ); 
	elseif eq = "Pegasus_c2_ip1jp1_u0":	% equation (5) for u=0 (valid for c=2, hardcoded)
							gredge( PVouter(2,i,j)-pici, PVouter(0,i+1,j+1)-pici, clr, emode ); 
	elseif eq = "Pegasus_c2_ip1jp1_u1":	% equation (5) for u=1 (valid for c=2, hardcoded)
							gredge( PVouter(2,i,j)+pici, PVouter(0,i+1,j+1)+pici, clr, emode ); 
	elseif eq = "Pegasus_c2_ijp1_u0":	% equation (6) (valid for c=2, hardcoded)
							gredge( PVouter(2,i,j), PVouter(0,i,j+1), clr, emode );
	elseif eq = "Pegasus_c2_ip1j_u1":	% equation (7) (valid for c=2, hardcoded)
							gredge( PVouter(2,i,j), PVouter(0,i+1,j), clr, emode ); 
	fi;
fi;

enddef;

% drawing vertices for unit cell of coordinates c,i,j
vardef ucvertex(expr c,i,j) =
	if innermode<>"Dot":
				for u = 0 upto 1:
					for p = 0 upto 1:
						for q = 0 upto 1:
							grvertex( PV(c,i,j,u,p,q) );
							if showindices=1: label.top(TEX("\tiny $"&decimal(c)&decimal(i)&decimal(j)&decimal(u)&decimal(p)&decimal(q)&"$") rotated 20, PV(c,i,j,u,p,q) ); fi;
						endfor;
					endfor;
				endfor;
	else:
							grvertex( PVouter(c,i,j) );
							if showindices=1: label.top(TEX("\tiny $"&decimal(c)&decimal(i)&decimal(j)&"$") rotated 20, PVouter(c,i,j) ); fi;
	fi;
enddef;

% ** output: unit cells *******************************************************

if innermode<>"Dot":

outputtemplate := "fig_Chimera"&innermode&outermode&"UC.eps";
beginfig(0)
				edgeeq("Chimera_K44",0,0,0,cgrey,"continuous");
				ucvertex(0,0,0);
endfig;

outputtemplate := "fig_Pegasus"&innermode&outermode&"UC.eps";
beginfig(0)
				edgeeq("Pegasus_UC",0,0,0,cblack,"continuous");
				edgeeq("Chimera_K44",0,0,0,cgrey,"continuous");
				ucvertex(0,0,0);
endfig;

fi;

% ** 3xLxL layout *************************************************************

picture ChimeraLL;
ChimeraLL := image(
	chimeraonly := 1;
	numeric c; c := 1;
		for i = 0 upto L-1:
			for j = 0 upto L-1:
				edgeeq("Chimera_K44",c,i,j,cgrey,"continuous");
			endfor;
		endfor;
		for i = 0 upto L-1:
			for j = 0 upto L-2:
				edgeeq("Chimera_Vertical",c,i,j,cgrey,"continuous");
			endfor;
		endfor;
		for i = 0 upto L-2:
			for j = 0 upto L-1:
				edgeeq("Chimera_Horizontal",c,i,j,cgrey,"continuous");
			endfor;
		endfor;
	chimeraonly := 0;
); % of ChimeraLL

picture PegasusLLone;
PegasusLLone := image(
	for c = 0 upto 2:
		for i = 0 upto L-1:
			for j = 0 upto L-1:
				edgeeq("Chimera_K44",c,i,j,cgrey,"continuous");
				edgeeq("Pegasus_UC",c,i,j,cblack,"continuous");
			endfor;
		endfor;
	endfor;
	for c = 0 upto 2:
		for i = 0 upto L-1:
			for j = 0 upto L-2:
				edgeeq("Chimera_Vertical",c,i,j,cgrey,"continuous");
			endfor;
		endfor;
	endfor;
	for c = 0 upto 2:
		for i = 0 upto L-2:
			for j = 0 upto L-1:
				edgeeq("Chimera_Horizontal",c,i,j,cgrey,"continuous");
			endfor;
		endfor;
	endfor;
	numeric c,i,j;
	c := 1;
	i := 2;
	j := 2;
				% outgoing edges
				edgeeq("Pegasus_c01_ij_u0",c,i,j,cblue,"continuous");
				edgeeq("Pegasus_c01_ij_u1",c,i,j,cred,"continuous");
				edgeeq("Pegasus_c01_ijm1_u1",c,i,j,corange,"continuous");
				edgeeq("Pegasus_c01_im1j_u0",c,i,j,cgreen,"continuous");
				% incoming edges
				edgeeq("Pegasus_c01_ij_u0",c-1,i,j,cblue,"continuous");
				edgeeq("Pegasus_c01_ij_u1",c-1,i,j,cred,"continuous");
				edgeeq("Pegasus_c01_ijm1_u1",c-1,i,j+1,corange,"continuous");
				edgeeq("Pegasus_c01_im1j_u0",c-1,i+1,j,cgreen,"continuous");
); % of PegasusLLone

picture PegasusLLfull;
PegasusLLfull := image(
	for c = 0 upto 2:
		for i = 0 upto L-1:
			for j = 0 upto L-1:
				edgeeq("Chimera_K44",c,i,j,cgrey,"continuous");
				edgeeq("Pegasus_UC",c,i,j,cblack,"continuous");
			endfor;
		endfor;
	endfor;
	for c = 0 upto 2:
		for i = 0 upto L-1:
			for j = 0 upto L-2:
				edgeeq("Chimera_Vertical",c,i,j,cgrey,"continuous");
			endfor;
		endfor;
	endfor;
	for c = 0 upto 2:
		for i = 0 upto L-2:
			for j = 0 upto L-1:
				edgeeq("Chimera_Horizontal",c,i,j,cgrey,"continuous");
			endfor;
		endfor;
	endfor;
	for c = 0 upto 1:
		for i = 0 upto L-1:
			for j = 0 upto L-1:
				edgeeq("Pegasus_c01_ij_u0",c,i,j,cblue,"continuous");
				edgeeq("Pegasus_c01_ij_u1",c,i,j,cred,"continuous");
			endfor;
		endfor;
		for i = 0 upto L-1:
			for j = 1 upto L-1:
				edgeeq("Pegasus_c01_ijm1_u1",c,i,j,corange,"continuous");
			endfor;
		endfor;
		for i = 1 upto L-1:
			for j = 0 upto L-1:
				edgeeq("Pegasus_c01_im1j_u0",c,i,j,cgreen,"continuous");
			endfor;
		endfor;
	endfor;

		for i = 0 upto L-2:
			for j = 0 upto L-2:
				edgeeq("Pegasus_c2_ip1jp1_u0",2,i,j,cblue,"continuous");
				edgeeq("Pegasus_c2_ip1jp1_u1",2,i,j,cred,"continuous");
			endfor;
		endfor;
		for i = 0 upto L-1:
			for j = 0 upto L-2:
				edgeeq("Pegasus_c2_ijp1_u0",2,i,j,cgreen,"continuous");
			endfor;
		endfor;
		for i = 0 upto L-2:
			for j = 0 upto L-1:
				edgeeq("Pegasus_c2_ip1j_u1",2,i,j,corange,"continuous");
			endfor;
		endfor;
); % of PegasusLLfull

picture PegasusLLfullblue;
PegasusLLfullblue := image(
	for c = 0 upto 2:
		for i = 0 upto L-1:
			for j = 0 upto L-1:
				edgeeq("Chimera_K44",c,i,j,cgrey,"continuous");
				edgeeq("Pegasus_UC",c,i,j,cblack,"continuous");
			endfor;
		endfor;
	endfor;
	for c = 0 upto 2:
		for i = 0 upto L-1:
			for j = 0 upto L-2:
				edgeeq("Chimera_Vertical",c,i,j,cgrey,"continuous");
			endfor;
		endfor;
	endfor;
	for c = 0 upto 2:
		for i = 0 upto L-2:
			for j = 0 upto L-1:
				edgeeq("Chimera_Horizontal",c,i,j,cgrey,"continuous");
			endfor;
		endfor;
	endfor;
	color cblues[];
	%cblues[0] := cdblue;
	cblues[0] := clblue;
	%cblues[1] := cblue;
	cblues[1] := clblue;
	cblues[2] := clblue;
	for c = 0 upto 1:
		for i = 0 upto L-1:
			for j = 0 upto L-1:
				edgeeq("Pegasus_c01_ij_u0",c,i,j,cblues[c],"continuous");
				edgeeq("Pegasus_c01_ij_u1",c,i,j,cblues[c],"continuous");
			endfor;
		endfor;
		for i = 0 upto L-1:
			for j = 1 upto L-1:
				edgeeq("Pegasus_c01_ijm1_u1",c,i,j,cblues[c],"continuous");
			endfor;
		endfor;
		for i = 1 upto L-1:
			for j = 0 upto L-1:
				edgeeq("Pegasus_c01_im1j_u0",c,i,j,cblues[c],"continuous");
			endfor;
		endfor;
	endfor;

		for i = 0 upto L-2:
			for j = 0 upto L-2:
				edgeeq("Pegasus_c2_ip1jp1_u0",2,i,j,cblues[2],"continuous");
				edgeeq("Pegasus_c2_ip1jp1_u1",2,i,j,cblues[2],"continuous");
			endfor;
		endfor;
		for i = 0 upto L-1:
			for j = 0 upto L-2:
				edgeeq("Pegasus_c2_ijp1_u0",2,i,j,cblues[2],"continuous");
			endfor;
		endfor;
		for i = 0 upto L-2:
			for j = 0 upto L-1:
				edgeeq("Pegasus_c2_ip1j_u1",2,i,j,cblues[2],"continuous");
			endfor;
		endfor;
); % of PegasusLLfullblue


picture ChimeraLLDots;
ChimeraLLDots := image(
	chimeraonly := 1;
	numeric c; c := 1;
		for i = 0 upto L-1:
			for j = 0 upto L-1:
				ucvertex(c,i,j);
			endfor;
		endfor;
	chimeraonly := 0;
); % of ChimeraLLDots

picture PegasusLLDots;
PegasusLLDots := image(
	for c = 0 upto 2:
		for i = 0 upto L-1:
			for j = 0 upto L-1:
				ucvertex(c,i,j);
			endfor;
		endfor;
	endfor;
); % of PegasusLLDots



% ** output: graphs ***********************************************************

numeric bbl,bbt,bbr,bbb;	% bounding box parameters
path bb;			% path for bounding box

% understand how "setbounds" works, then "calcbb" could be simplified
vardef calcbb(expr il,jt,ir,jb)=
	bbl := min( xpart(.5[PVouter(1,il,jb),PVouter(1,il-1,jb-1)]), xpart(.5[PVouter(1,il,jt),PVouter(1,il-1,jt+1)]) );
	bbt := max( ypart(.5[PVouter(1,ir,jt),PVouter(1,ir+1,jt+1)]), ypart(.5[PVouter(1,il,jt),PVouter(1,il-1,jt+1)]) );
	bbr := max( xpart(.5[PVouter(1,ir,jt),PVouter(1,ir+1,jt+1)]), xpart(.5[PVouter(1,ir,jb),PVouter(1,ir+1,jb-1)]) );
	bbb := min( ypart(.5[PVouter(1,il,jb),PVouter(1,il-1,jb-1)]), ypart(.5[PVouter(1,ir,jb),PVouter(1,ir+1,jb-1)]) );
enddef;


% uncropped output

chimeraonly := 1;
calcbb(0,L-1,L-1,0);
bb:=(bbl,bbb)--(bbr,bbb)--(bbr,bbt)--(bbl,bbt)--cycle;
setbounds ChimeraLL to bb;
setbounds ChimeraLLDots to bb;
chimeraonly := 0;

outputtemplate := "fig_Chimera"&innermode&outermode&decimal(L)&"x"&decimal(L)&".eps";
beginfig(0)
	draw ChimeraLL; 
	draw ChimeraLLDots;
endfig;


calcbb(0,L-1,L-1,0);
bb:=(bbl,bbb)--(bbr,bbb)--(bbr,bbt)--(bbl,bbt)--cycle;
setbounds PegasusLLone to bb;
setbounds PegasusLLfull to bb;
setbounds PegasusLLfullblue to bb;
setbounds PegasusLLDots to bb;

outputtemplate := "fig_Pegasus"&innermode&outermode&decimal(L)&"x"&decimal(L)&"one.eps";
beginfig(0)
	draw PegasusLLone;
	draw PegasusLLDots;
endfig;

outputtemplate := "fig_Pegasus"&innermode&outermode&decimal(L)&"x"&decimal(L)&"full.eps";
beginfig(0)
	draw PegasusLLfull;
	draw PegasusLLDots;
endfig;

outputtemplate := "fig_Pegasus"&innermode&outermode&decimal(L)&"x"&decimal(L)&"fullblue.eps";
beginfig(0)
	draw PegasusLLfullblue;
	draw PegasusLLDots;
endfig;



% cropped output

chimeraonly := 1;
calcbb(1,2,2,1);
bb:=(bbl,bbb)--(bbr,bbb)--(bbr,bbt)--(bbl,bbt)--cycle;
setbounds ChimeraLL to bb;
setbounds ChimeraLLDots to bb;
chimeraonly := 0;

outputtemplate := "fig_Chimera"&innermode&outermode&decimal(L)&"x"&decimal(L)&"_crop.eps";
beginfig(0)
	draw ChimeraLL; 
	draw ChimeraLLDots;
endfig;

%calcbb(1,3,3,1);
calcbb(2,2,2,2);
bb:=(bbl-sfh*dbblone,bbb-dbbbone)--(bbr+sfh*dbbrone,bbb-dbbbone)--(bbr+sfh*dbbrone,bbt+dbbtone)--(bbl-sfh*dbblone,bbt+dbbtone)--cycle;
setbounds PegasusLLone to bb;
setbounds PegasusLLDots to bb;

outputtemplate := "fig_Pegasus"&innermode&outermode&decimal(L)&"x"&decimal(L)&"one_crop.eps";
beginfig(0)
	draw PegasusLLone;
	draw PegasusLLDots;
endfig;

calcbb(0,1,1,0);
bb:=(bbl-sfh*dbblfull,bbb-dbbbfull)--(bbr+sfh*dbbrfull,bbb-dbbbfull)--(bbr+sfh*dbbrfull,bbt+dbbtfull)--(bbl-sfh*dbblfull,bbt+dbbtfull)--cycle;
setbounds PegasusLLfull to bb;
setbounds PegasusLLfullblue to bb;
setbounds PegasusLLDots to bb;

outputtemplate := "fig_Pegasus"&innermode&outermode&decimal(L)&"x"&decimal(L)&"full_crop.eps";
beginfig(0)
	draw PegasusLLfull;
	draw PegasusLLDots;
endfig;

outputtemplate := "fig_Pegasus"&innermode&outermode&decimal(L)&"x"&decimal(L)&"fullblue_crop.eps";
beginfig(0)
	draw PegasusLLfullblue;
	draw PegasusLLDots;
endfig;


if innermode<>"Dot":

bb := ((-.5ut,-ut)--(+.5ut,-ut)--(+.5ut,+ut)--(-.5ut,+ut)--cycle) shifted if innermode = "Std": PV(2,2,2,1,0,0) else: PV(2,2,2,0,0,1) fi;
setbounds PegasusLLfull to bb;
setbounds PegasusLLfullblue to bb;
setbounds PegasusLLDots to bb;

outputtemplate := "fig_Pegasus"&innermode&outermode&decimal(L)&"x"&decimal(L)&"full_vertexcrop.eps";
beginfig(0)
	draw PegasusLLfull;
	draw PegasusLLDots;
endfig;

outputtemplate := "fig_Pegasus"&innermode&outermode&decimal(L)&"x"&decimal(L)&"fullblue_vertexcrop.eps";
beginfig(0)
	draw PegasusLLfullblue;
	draw PegasusLLDots;
endfig;

%else:

fi;


end;
