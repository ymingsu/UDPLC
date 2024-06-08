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
% one can modified the parameters to see their effect.
% default_paras=struct(... % the default parameters for plc
% 'n_points',500,... % the polarization line number are n_points*3
% 'lambda',0.1, ... % see wls lambda
% 'B_inf',[],... % user input of Backscater light at infinity 
% 'mB',[],... % user input of Backscater polarization state
% 'B_inf_method','quadTree',... % Backscater estimation method. i.e. quadTree, DCP
% 'eta',1.15,... % parameter for calculating mB
% 'bBoostEnabled',true,... % Resize the image smaller to speed it up
% 'alpha',0.95,... % parameter for calculating td
% 'BoostScale',1/8,... % parameter for imresize
% 'wbmethod','gray'... % white balance method, i.e. gray, pca, white or off.
% );
% [J_dehaze,t_est,r_est,mD_est,mB_est,B_inf] = PLC(loadData,default_paras);
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
