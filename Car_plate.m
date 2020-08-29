clc
clear all
A=rgb2gray(imread('C:\Users\acer\Documents\MATLAB\Car number plate/e.jpg'));
modifyA=zeros(size(A)+2);
I=zeros(size(A));

I=uint8(A);
figure(1),imshow(I), title('Original Grayscale Image'); 

figure(2),imhist(I),title('Histogram'); % Check for the blackest region

manual =im2bw(I,200/255); % Manual Thresholding of vaue 200
figure(3),imshow(manual),title('Manual Thresolding Output'); 

M = medfilt2(manual); % Applying median filter
figure(4), imshow(M), title('Smooth Image with Median FIlter');

SE = strel('rectangle',[5 5]);
MO = imopen(M,SE); % Morphological Opening
SE = strel('rectangle',[1 8]);
MO = imopen(MO,SE); % Morphological Opening
figure(5), imshow(MO), title('Remove unwanted distortion with Median FIlter');