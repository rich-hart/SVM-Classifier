%figure(1);

%figure(1);

%clear;


LoadData;
%file_names={'bad_chip.jpg' ; 'good_chip.jpg'};

data=[];
%group={'b';'g'};
for i = 1:length(file_names)

    file_name= file_names{i};
    
    chip_imdata_color = imread(file_name);

    data=[data;GenerateData(chip_imdata_color)];

end

indexs=1:length(data);
train_index=datasample(indexs,floor(length(data)/2),'Replace',false);
test_indexs=setdiff(indexs,train_index);

test_indexs=test_indexs';
train_index=train_index';

training=data(train_index,:);
testing=data(test_indexs,:);

training_group=group(train_index);
testing_group=group(test_indexs);

SVMStruct = svmtrain(training,training_group);

svm_group_results=svmclassify(SVMStruct,testing);

correct=0;
for i = 1:length(svm_group_results)
if(strcmp(svm_group_results{i},testing_group{i}));
    correct=correct+1;
end

end
percent_correct=correct/length(svm_group_results);
%gray_double=im2double(chip_imdata_gray);
%p=entropy(gray_double);
%en=-sum(p.*log2(p))

%scatter(bad_chip_corner_points(:,2),bad_chip_corner_points(:,1));
