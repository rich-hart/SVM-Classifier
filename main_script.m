%{
Module: main.m
Purpose: runs svm classification software.
Description: This module serves as script that initiates the SVM
classification program. 
Author: Rich Hart
%}
clear;

image_set_directory='Flowers';
image_set_complement_directory='Foliage';


p_origenal = path;
path_temp = path(p_origenal  , image_set_directory);
path(path_temp,image_set_complement_directory);


image_set_file_names=GetImageFileNames( image_set_directory );
image_set_complement_file_names=GetImageFileNames( image_set_complement_directory);

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

total_number_set_samples=length(image_set_file_names);
total_number_set_complement_samples=length(image_set_complement_file_names);
total_number_samples=total_number_set_samples+total_number_set_complement_samples;

set_data=zeros(total_number_set_samples,total_number_feature_vectors);
set_complement_data=zeros(total_number_set_complement_samples,total_number_feature_vectors);

for i = 1:total_number_set_samples

    file_name= image_set_file_names{i};
    
    chip_imdata_color = imread(file_name);

    set_data(i,:)=GenerateData(chip_imdata_color);

end

for i = 1:total_number_set_complement_samples

    file_name= image_set_complement_file_names{i};
    
    chip_imdata_color = imread(file_name);

    set_complement_data(i,:)=GenerateData(chip_imdata_color);

end

group_set=cell(total_number_set_samples,1);

for i = 1:total_number_set_samples
    group_set{i}=image_set_directory;
end

group_set_complement=cell(total_number_set_samples,1);

for i = 1:total_number_set_complement_samples
    group_set_complement{i}=image_set_complement_directory;
end

data=[set_data;set_complement_data];

lables=[group_set;group_set_complement];

indexs=1:total_number_samples;
indexs=indexs';

training_index=datasample(indexs,floor(length(data)/2),'Replace',false);
testing_indexs=setdiff(indexs,training_index);

training=data(training_index,:);
testing=data(testing_indexs,:);

training_lables=lables(training_index,1);
testing_lables=lables(testing_indexs,1);

SVMStruct = svmtrain(training,training_lables);

svm_group_results=svmclassify(SVMStruct,testing);

correct=0;
for i = 1:length(svm_group_results)
if(strcmp(svm_group_results{i},testing_lables{i}));
    correct=correct+1;
end

end
percent_correct=correct/length(svm_group_results);

path(p_origenal);
