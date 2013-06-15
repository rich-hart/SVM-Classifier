%figure(1);

figure(1);

clear;

chip_imdata_color = imread('bad_chip.jpg');

%ax(1) = subplot(1,2,1);

%imshow(chip_imdata_color);

chip_imdata_gray=rgb2gray(chip_imdata_color);

%chip_edge_data=edge(chip_imdata_gray,'sobel');

%ax(2) = subplot(1,2,2);

%imshow(chip_imdata_color);

chip_corner_points=corner(chip_imdata_gray);

%hold on

%plot(chip_corner_points(:,1), chip_corner_points(:,2), 'r*');

red_data=zeros(length(chip_corner_points),1);
green_data=zeros(length(chip_corner_points),1);
blue_data=zeros(length(chip_corner_points),1);
gray_data=zeros(length(chip_corner_points),1);
[m n c]=size(chip_imdata_color);
for i = 1:length(chip_corner_points)
    y=chip_corner_points(i,1);
    x=chip_corner_points(i,2);
    red_data(i,1)=chip_imdata_color(x,y,1);
    green_data(i,1)=chip_imdata_color(x,y,2);
    blue_data(i,1)=chip_imdata_color(x,y,3);
    gray_data(i,1)=chip_imdata_gray(x,y);
end

figure(1);

imshow(chip_imdata_color);

mean(red_data)
mean(green_data)
mean(blue_data)
mean(gray_data)

std(red_data)
std(green_data)
std(blue_data)
std(gray_data)

mean2(chip_imdata_color)
std2(chip_imdata_color)
gray_double=im2double(chip_imdata_gray);
p=entropy(gray_double);
en=-sum(p.*log2(p))

%scatter(bad_chip_corner_points(:,2),bad_chip_corner_points(:,1));
