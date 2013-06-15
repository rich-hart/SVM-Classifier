function [ data ] = GenerateData( chip_imdata_color )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
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

%figure(1);

%imshow(chip_imdata_color);

data=zeros(1,10);

data(1,1)=mean(red_data);
data(1,2)=mean(green_data);
data(1,3)=mean(blue_data);
data(1,4)=mean(gray_data);

data(1,5)=std(red_data);
data(1,6)=std(green_data);
data(1,7)=std(blue_data);
data(1,8)=std(gray_data);

data(1,9)=mean2(chip_imdata_color);
data(1,10)=std2(chip_imdata_color);


end

