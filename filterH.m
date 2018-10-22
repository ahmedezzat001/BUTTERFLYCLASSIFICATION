function [ weight] = filterH( img, minZ, maxX, debug)
%FILTER ON H CHANNEL 
%   The function applies a hue filter in the image within the specified interval,
%   incase debug mode activated (debug==1) the relevant information wil be shown.

Area=getArea(img);
[row,col,ch]=size(img);

imHSV=rgb2hsv(img);

[countsh,xh]=imhist(imHSV(:,:,1));
countsh=countsh(2:size(countsh));
xh=xh(2:size(xh,1));

im_BW=imHSV(:,:,1)>minZ & imHSV(:,:,1)<maxX;
[counts,x]=imhist(im_BW);
counts(1)=counts(1)-(row*col-Area);
counts=counts./Area;

aux=max(countsh);

if (debug==1)
    figure;
    subplot(2,2,1); stem(xh,countsh);
    hold on
    line([minZ,minZ],[0,aux],'Color',[0 0 0],'LineWidth',1);
    line([maxX,maxX],[0,aux],'Color',[0 0 0],'LineWidth',1);
    hold off; title('h');
    subplot(2,2,2); imshow(img); title('original');
    subplot(2,2,3); bar(x,counts); title('weight');
    subplot(2,2,4); imshow(im_BW); title('filter')
end

weight=counts(2)*100;

end