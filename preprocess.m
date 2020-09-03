clc
clear all
close all
%Reading an Image
image=imread('train\0_p2.bmp');

image=imresize(image,[64,64]);          
subplot(2,2,1);
imshow(image);
title('Original Image')

if(size(image,3)>1)                    
  image=rgb2gray(image);                 
end                                     

[m,n]=size(image);                      
                                       
distance=zeros(350,1);
im=zeros(m,n);

for a=1:m                               
    for b=1:n
        if image(a,b)>200
            im(a,b)=1;
        else
            im(a,b)=0;
        end
    end
end

im=~im;                                 
subplot(2,2,2);
imshow(im);
title('Inverted Image');

im1=bwmorph(im,'dilate');
subplot(2,2,3);
imshow(im1);
title('Dilated Image');

im2=bwmorph(im1,'thin',Inf);
subplot(2,2,4);
imshow(im2);
title('Thin Image');