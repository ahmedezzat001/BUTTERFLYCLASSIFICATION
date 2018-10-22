creal all; close all; clc;

%Check Treshold information
mainDir='E:\AAST\CIMET\matlab\project\Dataset\leedsbutterfly_dataset_v1.0\leedsbutterfly\output_seg\';
type='003';
target=10;

p=0;
RESULT=[];
allFiles = dir(mainDir);
allNames = {allFiles.name};

allNames = allNames(3:end);
[a,b]=size(allNames);

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





% Enter here the code for testing!
% (change the values and/or the filter type as in table no.2)
% this is how the function looks :
% filterH( img, minZ, maxX, debug)
% its better to let debug = 0 ,
% if 1 it shows the filter figure  

%study histograms in hsv 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
red=filterH(img,0,0.03,0);
red=red+filterH(img,0.97,1,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RESULT(p)=red;


end

end

per=0;
for i=1:size(RESULT,2)
if RESULT(i)>target
per=per+1;
end
end
per=100 * per/size(RESULT,2);

display(RESULT);
display(per);