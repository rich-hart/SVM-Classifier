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

Create_And_Test_SVM( image_set_directory,image_set_complement_directory )
%Create_SVM_Classifier(image_set_directory,image_set_complement_directory);
 

path(p_origenal);
