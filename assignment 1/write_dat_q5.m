% Clean previous variables, figures and results
clear all;
close all;
clc;

% Read known type graphics image
read_into_matrix = imread('images\sundial_bw.tif');    

% plot grayscale adjusted image
% using 'gray' colormap command 
figure('Name','Image: Grayscale sundial ');
image(read_into_matrix);
colormap(gray);

% Find no. of rows and columns
[img_h, img_w] = size(read_into_matrix); 

% Reshape matrix to vector for storing to a binary data file 
array_vlues = reshape(read_into_matrix, img_h * img_w, 1);

% create file with write and append permission
write_file_id = fopen('outputs\sundial_bw.dat','a');
% save uint8 data from the image.dat file 
fwrite(write_file_id, array_vlues,'uint8');
% Close the file (end of file operation)
fclose(write_file_id);                                
