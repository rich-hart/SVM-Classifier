function [ file_names ] = GetImageFileNames( dir_name )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

directory_listings = dir(dir_name);
total_listings=length(directory_listings);
total_listings=total_listings-2;
file_names=cell(total_listings,1);

for i = 1 : total_listings
    file_names{i}=directory_listings(i+2).name;
end


end

