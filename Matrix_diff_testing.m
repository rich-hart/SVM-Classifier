figure(1);
Z = imabsdiff(rgb2gray(imread('good_chip.jpg')),rgb2gray(imread('bad_chip.jpg')));
imshow(Z);