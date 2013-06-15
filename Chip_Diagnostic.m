%figure(1);

figure;

clear;

chip_imdata_color = imread('good_chip.jpg');

%ax(1) = subplot(1,2,1);

%imshow(chip_imdata_color);

chip_imdata_gray=rgb2gray(chip_imdata_color);

chip_edge_data=edge(chip_imdata_gray,'sobel');

%ax(2) = subplot(1,2,2);

%imshow(chip_imdata_color);

chip_corner_points=corner(chip_imdata_gray);

%hold on

%plot(chip_corner_points(:,1), chip_corner_points(:,2), 'r*');


for i = 1:length(chip_corner_points)
    y=chip_corner_points(i,1);
    x=chip_corner_points(i,2);
    chip_imdata_color(x,y,1)=255;
    chip_imdata_color(x,y,2)=0;
    chip_imdata_color(x,y,3)=0;
end
figure(1);
imshow(chip_imdata_color);
%scatter(bad_chip_corner_points(:,2),bad_chip_corner_points(:,1));
