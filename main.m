%% Init
clc;
clear;
close;
%% Load Image
load('./temp-09082021111910.mat');
%% PLC
[J_dehaze,t_est,r_est,mD_est,mB_est,B_inf] = PLC(loadData);
% The latter five outputs are varargout.
% varargout=t_est,r_est,mD_est,mB_est,B_inf
%% Restored Polarization information
% J_DoLP=abs(mD_est);
% J_AoLP=1/2*mod(angle(mD_est),2*pi);
%% Compare
Img_hazy=(loadData.RGB_0+loadData.RGB_45+loadData.RGB_90+loadData.RGB_135)/4;
figure;imshowpair(Img_hazy,J_dehaze,'montage');
%% Save image
% Img_hazypath='./temp-09082021111910_turbid.png';
% imwrite(Img_hazy,Img_hazypath);
% J_dehazepath='./temp-09082021111910_clear.png';
% imwrite(J_dehaze,J_dehazepath);
