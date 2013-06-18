%{
Module: main.m
Purpose: runs svm classification software.
Description: This module serves as script that initiates the SVM
classification program. 
Author: Rich Hart
%}
clear;
p_origenal = path;

try
image_set_directory='Classification_Problems/Plants/Flowers';
image_set_complement_directory='Classification_Problems/Plants/Foliage';


temp_path=path(p_origenal  , image_set_directory);
temp_path=path(temp_path  , image_set_complement_directory);


Create_And_Test_SVM( image_set_directory,image_set_complement_directory )
%SVMStruct=Create_SVM_Classifier(image_set_directory,image_set_complement_directory);
catch ME
   path(p_origenal); 
end

path(p_origenal);