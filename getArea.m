function [ A ] = getArea( X )
%getArea
%   Returns the number of pixels in wich the R, G and B values are all diferent
%   than 0.

XAux=X(:,:,1)+X(:,:,2)+X(:,:,3);
[row,col] = find(XAux);
[A,P]=size(row);

end

