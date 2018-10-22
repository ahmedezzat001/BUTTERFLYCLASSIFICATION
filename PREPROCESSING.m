%PREPROCESSING	
function [imgPre] = PREPROCESSING(img)
S=floor(getArea(img)/5000);	
H=fspecial('gaussian',S,3);	
imgF=imfilter(img,H,'replicate','same','conv');	
imgPre=imsharpen(imgF);	
end