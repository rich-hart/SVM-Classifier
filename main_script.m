%{
main_script.m

Purpose: svm classification example.

Description: This module serves as script that initiates the SVM
classification algorithm.  The script already has a set of images on which 
to test the svm classifier. 

Author: Rich Hart
%}
clear;

run_script_case=true;

%{
Set the image_set_directory and image_set_complement_directory 
variables to the locations where your training data resides.  Keep in mind
that an svm can only make binary classifications. In other words, an 
svm can only make a desision on whether a image is a part of the training
set and its complement. 
%}
image_set_directory='Classification_Problems/Plants/Flowers';
image_set_complement_directory='Classification_Problems/Plants/Foliage';

try
%{ 
    Temperarily add the image directories to matlabs path.  They will be
    removed once the program is finished running
    %}
p_origenal = path;
temp_path=path(p_origenal  , image_set_directory);
temp_path=path(temp_path  , image_set_complement_directory);

    %{
    run the svm functions
%}
if run_script_case
    %{
    this function takes two directories as its input.  The function then
    scans the directies for image files and analyses those images based on
    various types of image processing statistics( see Create_Category_Data_Set
 and GenerateData for more information).  Those statisics are
    used to create an SVM for image classifications.
    %}
    SVMStruct=Create_SVM_Classifier(image_set_directory,image_set_complement_directory);
   
else
    %{
    this function is similar to Create_SVM_Classifier, only it randomly divides the
    data into training and testing examples.  The training data is used to
    create the SVM, the testing data is used to evaluate SVM accuracy.  
    %}
   percent_correct=Create_And_Test_SVM( image_set_directory,image_set_complement_directory )
end

catch ME
   ME.stack
   path(p_origenal); 
end

path(p_origenal);