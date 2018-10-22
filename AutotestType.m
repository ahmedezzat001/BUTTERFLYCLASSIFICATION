function [ per, p, VAL ] = AutotestType( type )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

mainDir='C:\Users\GUR\Desktop\Matlab\PROJECT\Dataset\output_seg\';

p=0;
VAL=[];

allFiles = dir(mainDir);
allNames = {allFiles.name};

allNames = allNames(3:end);
[a,b]=size(allNames);

good=0;

for i=1:b

[pathstr,name,ext] = fileparts(allNames{i});
str= strsplit(name,'_');

if strcmp(str(1),type),

p=p+1;
    
path=strcat(mainDir,name);
path=strcat(path,'.jpg');

img= imread(path);
Area=getArea(img);
[row,col,ch]=size(img);

%Enter here the code for testing!
[class,value]=Buterfly(img);
VAL=vertcat(VAL,value);
%display(class);

if strcmp(str(1),class),
good=good+1;

end
end
end

per=100* good/p;

end

