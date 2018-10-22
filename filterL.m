function [ weight] = filterL( img, minZ, maxX, debug)
%FILTER ON L CHANNEL 
%   The function applies a level filter in the image within the specified interval,
%   incase debug mode activated (debug==1) the relevant information wil be shown.

Area=getArea(img);
[row,col,ch]=size(img);

imLab=rgb2lab(img);

[countsl,xl]=imhist(imLab(:,:,1)./100);
countsl=countsl(2:size(countsl));
xl=xl(2:size(xl,1));

im_BW=imLab(:,:,1)>100*minZ & imLab(:,:,1)<100*maxX;
[counts,x]=imhist(im_BW);
counts(1)=counts(1)-(row*col-Area);
counts=counts./Area;

aux=max(countsl);

if (debug==1)
    figure;
    subplot(2,2,1); stem(xl,countsl);
    hold on
    line([minZ,minZ],[0,aux],'Color',[0 0 0],'LineWidth',1);
    line([maxX,maxX],[0,aux],'Color',[0 0 0],'LineWidth',1);
    hold off; title('l');
    subplot(2,2,2); imshow(img); title('original');
    subplot(2,2,3); bar(x,counts); title('weight');
    subplot(2,2,4); imshow(im_BW); title('filter')
end

weight=counts(2)*100;

end