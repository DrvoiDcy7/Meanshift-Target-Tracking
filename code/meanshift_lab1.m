%%
%ÊÖ¶¯È¦¶¨¸ú×ÙÄ¿±ê
I=imread('img1.jpg');  
figure(1);  
imshow(I);  
[temp,rect]=imcrop(I);
[a,b,c]=size(temp);         %a:ÐÐ,b:ÁÐ
 
%%
%¼ÆËãÄ¿±êÍ¼ÏñµÄÈ¨Öµ¾ØÕó
y(1)=a/2;  
y(2)=b/2;  
tic_x=rect(1)+rect(3)/2;  
tic_y=rect(2)+rect(4)/2;  
m_wei=zeros(a,b);%È¨Öµ¾ØÕó  
h=y(1)^2+y(2)^2 ;%´ø¿í  
for i=1:a  
    for j=1:b  
        dist=(i-y(1))^2+(j-y(2))^2;  
        m_wei(i,j)=1-dist/h; %epanechnikov kernel  
    end  
end  
C=1/sum(sum(m_wei));%¹éÒ»»¯ÏµÊý  
 
%%
%¼ÆËãÄ¿±êÈ¨ÖµÖ±·½Í¼
%hist1=C*wei_hist(temp,m_wei,a,b);%target model  
hist1=zeros(1,4096);  
for i=1:a  
    for j=1:b  
        %rgbÑÕÉ«¿Õ¼äÁ¿»¯Îª16*16*16 bins  
        q_r=fix(double(temp(i,j,1))/16);    
        q_g=fix(double(temp(i,j,2))/16);  
        q_b=fix(double(temp(i,j,3))/16);  
        q_temp=q_r*256+q_g*16+q_b;            %ÉèÖÃÃ¿¸öÏñËØµãºìÉ«¡¢ÂÌÉ«¡¢À¶É«·ÖÁ¿ËùÕ¼±ÈÖØ  
        hist1(q_temp+1)= hist1(q_temp+1)+m_wei(i,j);    %¼ÆËãÖ±·½Í¼Í³¼ÆÖÐÃ¿¸öÏñËØµãÕ¼µÄÈ¨ÖØ  
    end  
end  
hist1=hist1*C;  
rect(3)=ceil(rect(3));
rect(4)=ceil(rect(4));
 
%%
%¶ÁÈ¡ÐòÁÐÍ¼Ïñ  
myfile=dir('D:\matlab\data\meanshift\*.jpg');  
lengthfile=length(myfile);
for l=1:lengthfile  
    Im=imread(myfile(l).name);  
    num=0;  
    Y=[2,2];  
   %% 
    %mean shiftµü´ú  
    while((Y(1)^2+Y(2)^2>0.5)&num<20)   %µü´úÌõ¼þ  
        num=num+1;  
        temp1=imcrop(Im,rect);  
        %¼ÆËãºîÑ¡ÇøÓòÖ±·½Í¼  
        hist2=zeros(1,4096);  
        for i=1:a  
            for j=1:b  
                q_r=fix(double(temp1(i,j,1))/16);  
                q_g=fix(double(temp1(i,j,2))/16);  
                q_b=fix(double(temp1(i,j,3))/16);  
                q_temp1(i,j)=q_r*256+q_g*16+q_b;  
                hist2(q_temp1(i,j)+1)= hist2(q_temp1(i,j)+1)+m_wei(i,j);  
            end  
        end  
        hist2=hist2*C;  
        figure(2);  
        subplot(1,2,1);  
        plot(hist2);  
        hold on;  
        w=zeros(1,4096);  
        for i=1:4096  
            if(hist2(i)~=0)   
                w(i)=sqrt(hist1(i)/hist2(i));  
            else  
                w(i)=0;  
            end  
        end  
        %±äÁ¿³õÊ¼»¯  
        sum_w=0;  
        xw=[0,0];  
        for i=1:a;  
            for j=1:b  
                sum_w=sum_w+w(uint32(q_temp1(i,j))+1);  
                xw=xw+w(uint32(q_temp1(i,j))+1)*[i-y(1)-0.5,j-y(2)-0.5];  
            end  
        end  
        Y=xw/sum_w;  
        %ÖÐÐÄµãÎ»ÖÃ¸üÐÂ  
        rect(1)=rect(1)+Y(2);  
        rect(2)=rect(2)+Y(1);  
    end  
    %¸ú×Ù¹ì¼£¾ØÕó  
    tic_x=[tic_x;rect(1)+rect(3)/2];  
    tic_y=[tic_y;rect(2)+rect(4)/2];  
    v1=rect(1);  
    v2=rect(2);  
    v3=rect(3);  
    v4=rect(4); 
    %%
    %ÏÔÊ¾¸ú×Ù½á¹û  
    subplot(1,2,2);  
    imshow(uint8(Im));  
    title('Tracking result');  
    hold on;  
    plot([v1,v1+v3],[v2,v2],[v1,v1],[v2,v2+v4],[v1,v1+v3],[v2+v4,v2+v4],[v1+v3,v1+v3],[v2,v2+v4],'LineWidth',2,'Color','r');  
    plot(tic_x,tic_y,'LineWidth',2,'Color','b');        
end  