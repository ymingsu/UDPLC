function [cvpsnr, varargout]= cvpsnr(X, Y, peak)
% cvpsnr evaluates the complex value psnr between polarization states
% Version: 2023.09
%
% cvpsnr = cvpsnr(X, Y, peak)
%
% Output parameters:
% cvpsnr: cvpsnr between polarization states X and Y (both complex number)
%
% Input parameters:
%  X: polarization states whose dimensions should be same to that of Y
%  Y: polarization states whose dimensions should be same to that of X
%  peak (optional): peak value (default: 1 , the max DoLP is 1)
%
% Example:
%  X = imread('X.png');
%  Y = imread('Y.png');
%  cvpsnr = cvpsnr(X, Y);
%

if nargin < 3 
 peak = 1;
end

dif = (X - Y);
dif = dif .* conj(dif);
cvmse = sum( dif(:) ) / (numel(dif) + eps);
cvpsnr = 10 * log10( peak*peak / cvmse );
varargout{1} = cvmse;
end
