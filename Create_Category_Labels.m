function [ group_label ] = Create_Category_Labels( image_set_directory,total_number_set_samples )
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here

group_label=cell(total_number_set_samples,1);

for i = 1:total_number_set_samples
    group_label{i}=image_set_directory;
end


end

