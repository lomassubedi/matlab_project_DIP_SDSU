% Clean previous variables, figures and results
close all;
clear all;
clc;

% Create square boxes
black_square = 10 * ones([8 8]);    % dark square value 10, area: 8x8 px
white_square = 200 * ones([8 8]);   % bright square value 200, area: 8x8 px

%concatination for making a black and white square
pair_w_first = cat(2, white_square, black_square); % White square first 
pair_b_first = cat(2, black_square, white_square);  % Black square first

% Create a row of 8 b/w square boxes, white square first 
for i = 2:7
    if(rem(i, 2))
        pair_w_first = cat(2, pair_w_first, black_square);
    else
        pair_w_first = cat(2, pair_w_first, white_square);
    end
end

% Create a row of 8 b/w square boxes, black square first 
for i = 1:6
    if(rem(i, 2))
        pair_b_first = cat(2, pair_b_first, black_square);
    else
        pair_b_first = cat(2, pair_b_first, white_square);
    end
end

% Create 8x2 boxes. white square first in first row, blck box first in 2nd
whole_img = cat(1, pair_w_first, pair_b_first);

% create whole checker box with above 8x2 pair 
for i = 2:7
    if(rem(i, 2))
        whole_img = cat(1, whole_img, pair_b_first);
    else
        whole_img = cat(1, whole_img, pair_w_first);
    end
end

% The matrix is created corrosponding to the image
% show the image from 64x64 matrix using image function
% Uncomment this and fn below (colormap) to see the preview of image formed
image(whole_img);      

% Command for using only black and white color
colormap(bone);         
drawon;

%--------------------------------------------------------------------------
% binary file creation 

img_h = 64; % Known to us 
img_w = 64;

% Reshape matrix to vector for storing to a binary data file 
array_vlues = reshape(whole_img, img_h * img_w, 1);

% create file with write and append permission
write_file_id = fopen('outputs\checkerboard.dat','a');

% save uint8 data from the image.dat file 
fwrite(write_file_id, array_vlues,'uint8');

% Close the file (end of file operation)
fclose(write_file_id);                                
