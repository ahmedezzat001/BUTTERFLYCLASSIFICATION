function [ imgClass, values ] = Buterfly( img )
%Buterfly: Buterflies picture classification
%   The function uses a tree algorithm with filters in L and H coordinates
%   to differentiate between 10 types of buterflyes using an RGB picture with
%   the background in black (previously segmented)

values=zeros(1,10); %initialize vector for storing filter results
n=0; %filter counter

%Check for BLACK feature
black=filterL(img,0.05,0.2,0);
n=n+1;
values(n)=black;

if (black < 5)
    imgClass = '008';
    
else
%Check for WHITE feature 
white =filterL(img,0.8,1,0);
n=n+1;
values(n)=white;

if (white < 0.7)
    imgClass = '005';
    
else
%Check for ORANGE feature 
orange =filterH(PREPROCESSING(img),0.06,0.1,0);
n=n+1;
values(n)=orange;


if (orange < 20) %#2, #3, #6, #7 or #9
    %Check for RED feature 
    red  =filterH(PREPROCESSING(img),0,0.03,0)+ filterH(PREPROCESSING(img),0.97,1,0);
    n=n+1;
    values(n)=red;
    
    if (red < 10) %#2, #7 or #9
        %Check for YELLOW feature
        yellow  =filterH(PREPROCESSING(img),0.12,0.168,0);
        n=n+1;
        values(n)=yellow;
        
        if (yellow < 10)
            imgClass = '009';

        else %#2 or #7
        %Check WHITE/BLACK feature
            wb=values(2)/values(1);
        
            if (wb < 0.37)
            imgClass = '002';
            
            else
            imgClass = '007';
            
            end
        end
        
    else %#3 or #6
        %Check for BLUE feature
        blue  =filterH(PREPROCESSING(img),0.52,0.59,0);
        n=n+1;
        values(n)=blue;

        if (blue < 1)
        imgClass = '003';

        else 
        imgClass = '006';

        end
    end
    
else %#1, #4, #9 or #10
%Check for GRAY feature
gray  =filterL(PREPROCESSING(img),0.37,0.42,0);
n=n+1;
values(n)=gray;

if (gray < 6.5)
    % here we have 1,9 and 10 classes and we will distinguish them by distance
    
    % this vectors represent the mean values obtained from the filters on a
    % set of selected images from the dataset:
    one=[23.8894048059827,2.21061723195014,47.2619742090710,4.82264265433673];
    nine=[37.3755685999089,2.77259719153334,20.2309509349184,2.62914791906477];
    ten=[14.1125807453230,2.63595842342430,55.5856263800605,6.4];
    %we compute the distance and average to the absolute value
    d1=sum(abs((one-values(1:4))./one));
    d9=sum(abs((nine-values(1:4))./nine));
    d10=sum(abs((ten-values(1:4))./ten));
    
    D=[d1,d9,d10];
    %the minimum will give us the class
    if (min(D)==d1)
        imgClass='001';
    elseif (min(D)==d9)
        imgClass='009';
    else
        imgClass='010';
    end
else 
imgClass = '004';

end
end
end
end
end