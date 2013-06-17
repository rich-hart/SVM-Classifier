
file_names_A=GetImageFileNames('Flowers');

group_A=cell(length(file_names_A),1);

for i=1:length(file_names_A)
    group_A{i}='Flowers';
end


file_names_B=GetImageFileNames('Foliage');

group_B=cell(length(file_names_B),1);

for i=1:length(file_names_B)
    group_B{i}='Foliage';
end

group=[group_A;group_B];
file_names=[file_names_A;file_names_B];

for i = 1:length(group)
    file_names{i}=[group{i} '/' file_names{i}]
end