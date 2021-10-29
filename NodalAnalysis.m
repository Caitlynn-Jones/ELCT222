clc
clear all

%input data
R1=9; R2=6; R3=8; C1=20e-9; C2=23e-9; 
f=1.4e6; om=2*pi*f;
ZC1=-j/(om*C1); ZC2=-j/(om*C2);
VS1=14*exp(j*.16); VS2=4*exp(j*.3);

%Nodal analysis by inspection
Z=[1/R1+1/ZC1+1/R2,-1/R2;-1/R2,1/R2+1/ZC2+1/R3];
Vs=[VS1/R1;-VS2/R3];
F=Z\Vs;

F1m=abs(F(1)) %amplitude of the potential at node 1
F1ph=angle(F(1)) %phase of the potential at node 1
F2=abs(F(2)) %amplitude of the potential at node 2
F2ph=angle(F(2)) %phase of the potential at node 2
Ir=F(2)/ZC2;
Irm=abs(Ir) %amplitude of the current flowing downwards through C2
Irph=angle(Ir) %phase of the current flowing downwards through C2
