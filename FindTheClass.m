 close all; clc;

%List of file types
file_types = {['*.BMP;*.GIF;*.HDF;*.JPEG;*.JPG;*.PBM;*.PCX;*.PGM;',...
    '*.PNG;*.PNM;*.PPM;*.RAS;*.TIFF;*.TIF;*.XWD'],'MATLAB Graphical Files'};


%% Get image 
[FileName,PathName,FilterIndex] = uigetfile(file_types, 'Select the main mosiac image');
%% Point to  "output_seg" folder in you PC please
img_dir = uigetdir();

path=strcat(PathName,FileName);
img= imread(path);
axes(handles.axes1);


%using Buterfly function to get the result of the test 
[classNumber,VAL]=Buterfly(img);
display(classNumber);
if strcmp('001', classNumber)
   s = sprintf('Class #1\n Danaus plexippus\n Monarch');
   d = '35.36';
   img1 = imread(strcat(img_dir,'001_0003_Seg.jpg'));
else if strcmp(classNumber,'002')
        s = sprintf('Heliconius charitonius\n Zebra Longwing');
        d = '22.58';
   img1 = imread(strcat(img_dir,'002_0003_Seg.jpg'));
        else if strcmp(classNumber,'003')
               s = sprintf('Heliconius erato \n Crimson-patched Longwing');
               d = '39.34 ';
   img1 = imread(strcat(img_dir,'003_0003_Seg.jpg'));
            else if strcmp(classNumber,'004')
           s = sprintf('Junonia coenia\nCommon Buckeye');
           d = '47.77';
   img1 = imread(strcat(img_dir,'004_0003_Seg.jpg'));
                    else if strcmp(classNumber,'005')
                   s = sprintf('Lycaena phlaeas\n American Copper');
                   d = '55.68';
   img1 = imread(strcat(img_dir,'005_0003_Seg.jpg'));
                        else if strcmp(classNumber,'006')
                       s = sprintf('Nymphalis antiopa\n Mourning Cloak');
                       d = '26';
   img1 = imread(strcat(img_dir,'006_0003_Seg.jpg'));
                            else if strcmp(classNumber,'007')
                        s =    sprintf('Papilio cresphontes\n Giant Swallowtail');
                        d = '29.21';
   img1 = imread(strcat(img_dir,'007_0003_Seg.jpg'));
                                else if strcmp(classNumber,'008')
                              s =  sprintf('Pieris rapae\n Cabbage White');
                              d = '98.18';
   img1 = imread(strcat(img_dir,'008_0003_Seg.jpg'));
                                    else if strcmp(classNumber,'009')
                                  s =  sprintf('Vanessa atalanta\n Red Admiral');
                                  d = '42.22';
   img1 = imread(strcat(img_dir,'009_0003_Seg.jpg'));
                                        else if strcmp(classNumber,'010')
                                       s = sprintf('Vanessa cardui\n Painted Lady');
                                       d = '35.71';
   img1 = imread(strcat(img_dir,'010_0003_Seg.jpg'));
                                            end
                                        end
                                    end
                                end
                            end
                        end
                  end
             end
      end
end

figure('Name','Butterfly Classification Function','NumberTitle','off')
subplot(1,2,1),imshow(imresize(img,1/2)); title({['This picture is '...
    ,d,'% belongs to' ]; s});
subplot(1,2,2),imshow(imresize(img1,1/2));title('Sample of The Class');