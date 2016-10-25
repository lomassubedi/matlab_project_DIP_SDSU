% Clean previous variables, figures and results
clear all;
close all;
clc;

% Read raw File (begining of file operation)
file_id = fopen('images/lena.dat', 'r');    
% save uint8 data from the image.dat file 
mat_img = fread(file_id, inf, 'uint8');         
% Close the file (end of file operation)
fclose(file_id);                                

% Since the image is square
% Image Height = image widht = sqare root of (no of bytes)
size_of_array = numel(mat_img);
img_size  = sqrt(size_of_array);

% Construction of matrix as that of data arranged in square image 
% without any headers.
fill_img = reshape(mat_img, img_size, img_size);

% plot original image
figure('Name','Image: original');
image(fill_img);
drawnow();

% plot grayscale adjusted image
% using 'gray' colormap command 
figure('Name','Image: grayscale adj');
image(fill_img);
colormap(gray);

hold on;
