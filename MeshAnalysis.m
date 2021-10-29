clc
clear all

%input data
VS1=80*exp(j*.1); VS2=40*exp(j*.2); VS3=50*exp(j*.1);
R1=400; R2=280; L1=17e-3; L2=8e-3; C1=35e-9; C2=20e-9;

f=20e3; om=2*pi*f;
ZL1=j*om*L1; ZL2=j*om*L2; ZC1=-j/(om*C1); ZC2=-j/(om*C2);

%mesh analysis
Z=[ZC1+R1+ZL1,-ZL1,-R1;...
   -ZL1, ZL1+ZL2, -ZL2;...
   -R1,-ZL2,ZC2+R2+ZL2+R1];
Vs=[VS1-VS2;VS2-VS3;0];

Imsh=Z\Vs;

IC2m=abs(Imsh(3)) %The amplitude of the current through C2 flowing left to right
IC2ph=angle(Imsh(3)) %The phase of the current through C2 flowing left to right
IL1=Imsh(1)-Imsh(2);
IL1m=abs(IL1) %The amplitude of the current through L1 flowing downward
IL1ph=angle(IL1) %The phase of the current through L1 flowing downward
VL=VS2+IL1*ZL1;
VLm=abs(VL) %The amplitude of the potential at the top lead of inductor L1
VLph=angle(VL) %The phase of the potential at the top lead of inductor L1
