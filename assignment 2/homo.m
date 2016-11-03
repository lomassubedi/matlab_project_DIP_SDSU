clear all
%read input image
dim=imread('tunnel_bw.jpg');
cim=double(dim);

[r,c]=size(dim);
cim=cim+1;
% add 1 to pixels to remove 0 values which would result in undefined log values

% natural log
lim=log(cim);

%2D fft
fim=fft2(lim);

lowg=.7; %(lower gamma threshold, must be lowg < 1)
highg=1.3; %(higher gamma threshold, must be highg > 1)
% make sure the the values are symmetrically differenced

% function call
him=homomorph(fim,lowg,highg);

%inverse 2D fft
ifim=ifft2(him);

 
 
%exponent of result
eim=exp(ifim);

imwrite(uint8(eim),'output2.jpg','jpg');