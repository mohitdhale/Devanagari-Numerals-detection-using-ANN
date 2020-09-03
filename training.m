function [ output ] = training( myImage )
    x1=[];  

    for i=0:9
        for j=1:50
           image=imread([ 'train\' num2str(i) '_p' num2str(j) '.bmp']);
           image=imresize(image,[64,64]);       


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
    % figure;
    % imshow(im);

    im1=bwmorph(im,'dilate');
    % figure;
    % imshow(im1);

    im2=bwmorph(im1,'thin',Inf);
    % figure;
    % imshow(im2);

    c=[1,1];

    bound=bwboundaries(im2,'noholes');    %%% Extracting the boundaries

    %B = bwboundaries(BW,conn,options) traces the exterior boundaries of objects, 
    %where options is either 'holes' or 'noholes', specifying whether you want to 
    %include the boundaries of holes inside other objects.

    x=bound{1,1}(:,1);                     %%% X coordinate of boundary
    y=bound{1,1}(:,2);                     %%% Y coordinate of boundary


    len=length(x);
    for u=1:len                                   
        distance(u,1)=abs((((x(u,1)-c(1)).^2)+((y(u,1)-c(2)).^2)).^0.5);
    end

    x1(:,end+1)=floor(distance);   %%% Making Feature matrix
        end
    end

    t=zeros(10,50);
    k=1;

    for i=1:10                     %%% Forming class matrix
        for j=1:50
            t(i,k)=1;
            k=k+1;
        end
    end

    %%%%  train  %%%%
    net=patternnet(500);
    net=train(net,x1,t);
    view(net);



    image2=imread(myImage);

    op_f=testing(image2);                       
    op_clas=net(op_f); 
    clas_disp=vec2ind(op_clas);

    clas_disp=clas_disp-1;
    disp('The number is');
    disp(clas_disp);

    output=['The number is  ',num2str(clas_disp)];

end

