 I = imread('bad_chip.jpg');
 I=rgb2gray(I);
 %I = I(1:150,1:120);
 subplot(1,3,1);
 imshow(I);
 title('Original Image');
 CM = cornermetric(I);
 
 
 CM_adjusted = imadjust(CM);
subplot(1,3,2);
imshow(CM_adjusted);
title('Corner Metric');



corner_peaks = imregionalmax(CM);
corner_idx = find(corner_peaks == true);
[r g b] = deal(I);
r(corner_idx) = 255;
g(corner_idx) = 255;
b(corner_idx) = 0;
RGB = cat(3,r,g,b);
subplot(1,3,3);
imshow(RGB);
title('Corner Points');