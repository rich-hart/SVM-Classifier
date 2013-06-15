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



SVMStruct = svmtrain(data,group);

%gray_double=im2double(chip_imdata_gray);
%p=entropy(gray_double);
%en=-sum(p.*log2(p))

%scatter(bad_chip_corner_points(:,2),bad_chip_corner_points(:,1));
