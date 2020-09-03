function [ distance ] = testing( image2 )
    image2=imresize(image2,[64,64]);
    image2=rgb2gray(image2);

    distance=zeros(350,1);

    im=image2>200;
    im=~im;

    im1=bwmorph(im,'dilate');

    im2=bwmorph(im1,'thin',Inf);
    c=[1,1];
    bound=bwboundaries(im2,'noholes');

    x=bound{1,1}(:,1);
    y=bound{1,1}(:,2);

    len=length(x);
        for u=1:len
            distance(u,1)=abs((((x(u,1)-c(1)).^2)+((y(u,1)-c(2)).^2)).^0.5);
        end

    distance=round(distance);
end
