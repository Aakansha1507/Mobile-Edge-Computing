# Mobile-Edge-Computing
clc;
clear all;
close all;
cell_radius=500;
d_d2d=50;
center=0;
n_devices=80;
n_d2d=80;
alpha=4;
delay_tol=0.01;
channel_bandwidth=5*10^6;
bandwidth=channel_bandwidth/n_devices;
noise_spectral_density= -174; % value in dBm
noise=10^((noise_spectral_density-30)/10);
pl_const=10^-2;
pmax=10^((24-30)/10);
fd=unifrnd(0.5,2)*10^9; % CPU cycles per second or instead of 0.5 we can take 2
fd2d=unifrnd(6,10)*10^9; %CPU cycles per second for helpers
cap=10^-28; %effective switched capacitance for local device
xd=unifrnd(1500,2000); % CPU cycles per bit
fes=40*10^9; % Computation resources of edge server

loop=1;
n_cl_el=4; % max. number of elements in a cluster
sinr_min_m=10; %10dB
sinr_min_d2d=10^0; %3dB
L=unifrnd(0.01,1,n_d2d,1)*10^6; % task size
[t,E,cst_opt,ratio_opt]=main_mec(L,cell_radius,d_d2d,center,n_devices,n_d2d,alpha,delay_tol,bandwidth,noise,pl_const,fd,fd2d,cap,xd,fes,pmax,n_cl_el,sinr_min_m,sinr_min_d2d,loop);
