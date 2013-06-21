function [ percent_correct ] = Create_And_Test_SVM( image_set_directory,image_set_complement_directory )
%UNTITLED18 Summary of this function goes here
%   Detailed explanation goes here

svm_postive_parameters=Generate_SVM_Parameters( image_set_directory );
svm_negative_parameters=Generate_SVM_Parameters( image_set_complement_directory );

data=[svm_postive_parameters.set_data;svm_negative_parameters.set_data];
lables=[svm_postive_parameters.set_labels;svm_negative_parameters.set_labels];

total_number_samples=length(data);

indexs=1:total_number_samples;
indexs=indexs';

training_index=datasample(indexs,floor(length(data)/2),'Replace',false);
testing_indexs=setdiff(indexs,training_index);

training_data=data(training_index,:);
testing_data=data(testing_indexs,:);

training_lables=lables(training_index,1);
testing_lables=lables(testing_indexs,1);

SVMStruct = svmtrain(training_data,training_lables);

svm_results=svmclassify(SVMStruct,testing_data);

correct=0.0;
for i = 1:length(svm_results)
    if(strcmp(svm_results{i},testing_lables{i}));
        correct=correct+1.0;
    end
    
end
percent_correct=100.0*correct/length(svm_results);

end

