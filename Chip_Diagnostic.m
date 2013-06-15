%figure(1);
figure;

clear;

chip_imdata_color = imread('good_chip.jpg');

ax(1) = subplot(1,2,1);

imshow(chip_imdata_color);

chip_imdata_gray=rgb2gray(chip_imdata_color);

chip_edge_data=edge(chip_imdata_gray,'sobel');

ax(2) = subplot(1,2,2);

imshow(chip_imdata_color);

chip_corner_points=corner(chip_imdata_gray);

hold on

plot(chip_corner_points(:,1), chip_corner_points(:,2), 'r*');

%scatter(bad_chip_corner_points(:,2),bad_chip_corner_points(:,1));
