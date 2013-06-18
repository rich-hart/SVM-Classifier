function [ data ] = GenerateData( chip_imdata_color ,image_analysis_functions )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

total_features=length(image_analysis_functions);

chip_imdata_gray=rgb2gray(chip_imdata_color);

chip_corner_points=corner(chip_imdata_gray);

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



data=zeros(1,total_features);
value=0;
for i=1:total_features 
    feature= image_analysis_functions{i};
    switch feature
        case 'AVERAGE_RED_CORNER_POINTS'
            value=mean(red_data);
        case  'AVERAGE_GREEN_CORNER_POINTS'
            value=mean(green_data);
        case 'AVERAGE_BLUE_CORNER_POINTS'
            value=mean(blue_data);
        case  'AVERAGE_GRAY_CORNER_POINTS'
            value=mean(gray_data);
        case  'AVERAGE_ENTIRE_COLOR_IMAGE'
            value=mean2(chip_imdata_color);
        case  'STDV_RED_CORNER_POINTS'
            value=std(red_data);
        case  'STDV_GREEN_CORNER_POINTS'
            value=std(green_data);
        case  'STDV_BLUE_CORNER_POINTS'
            value=std(blue_data);
        case  'STDV_GRAY_CORNER_POINTS'
           value=std(gray_data);
        case 'STDV_ENTIRE_COLOR_IMAGE'
            value=std2(chip_imdata_color);      
    end
            data(1,i)=value;
end


end

