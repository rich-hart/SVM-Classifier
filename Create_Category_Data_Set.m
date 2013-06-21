function [ set_data ] = Create_Category_Data_Set( image_set_directory )
% This function takes a directory path to a set of images. The function
% then analysis the 

image_analysis_functions={
    'AVERAGE_RED_CORNER_POINTS'
    'AVERAGE_GREEN_CORNER_POINTS'
    'AVERAGE_BLUE_CORNER_POINTS'
    'AVERAGE_GRAY_CORNER_POINTS'
    'AVERAGE_ENTIRE_COLOR_IMAGE'
    'STDV_RED_CORNER_POINTS'
    'STDV_GREEN_CORNER_POINTS'
    'STDV_BLUE_CORNER_POINTS'
    'STDV_GRAY_CORNER_POINTS'
    'STDV_ENTIRE_COLOR_IMAGE'
    };


total_number_feature_vectors=length(image_analysis_functions);

image_set_file_names=Get_Directory_Information( image_set_directory );

total_number_set_samples=length(image_set_file_names);

set_data=zeros(total_number_set_samples,total_number_feature_vectors);



for i = 1:total_number_set_samples

    file_name= image_set_file_names{i};
    
    chip_imdata_color = imread(file_name);

    set_data(i,:)=GenerateData(chip_imdata_color,image_analysis_functions);

end




end

