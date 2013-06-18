function [ svm_parameters ] = Generate_SVM_Parameters( image_set_directory )
%UNTITLED16 Summary of this function goes here
%   Detailed explanation goes here

svm_parameters.set_data=Create_Category_Data_Set(image_set_directory);
total_number_set_samples=length(svm_parameters.set_data);
svm_parameters.set_labels=Create_Category_Labels(image_set_directory,total_number_set_samples);

end

