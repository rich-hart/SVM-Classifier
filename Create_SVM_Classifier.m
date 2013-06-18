function [ SVMStruct ] = Create_SVM_Classifier( image_set_directory,image_set_complement_directory )
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here

svm_postive_parameters=Generate_SVM_Parameters( image_set_directory );
svm_negative_parameters=Generate_SVM_Parameters( image_set_complement_directory );

data=[svm_postive_parameters.set_data;svm_negative_parameters.set_data];
lables=[svm_postive_parameters.set_labels;svm_negative_parameters.set_labels];

SVMStruct = svmtrain(data,lables);

end

