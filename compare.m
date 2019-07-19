%六张一组 1和6同一张手光照不同汉明距离为0.27
PathRoot='C:\Users\hasee\Desktop\03Polyu_Pamprin\Polyu_Pamprint_600\';
list=dir(PathRoot);
fileNum=(size(list)-3); %样本个数
fileNum=fileNum(1,1);
%hosp(hamming of same palm)
%hodp(hamming of different palm)
counthosp=0;
counthodp=0;
for i=1:fileNum/6%同一类手掌类内距离,fileNum/6组手掌
    for j=1:5
        for k=j+1:6
            picgaborcode1=singletest((i-1)*6+j);
            picgaborcode2=singletest((i-1)*6+k);
            [m,n]=size(picgaborcode1);
            diversitysum=0;
            %Horz表示图1水平平移，-1表示左平移1，-2表示左平移2，0表示不平移，1表示右平移1，2表示右平移2
            %Vert表示图1垂直平移，-1表示下平移1，-2表示下平移2，0表示不平移，1表示上平移1，2表示上平移2
            %当Vert=0：
            %Horz=-2时，a1=1:m,b1=3:n,a2=1:m,b2=1:n-2
            %Horz=-1时，a1=1:m,b1=2:n,a2=1:m,b2=1:n-1
            %Horz=0时，a1=1:m,b1=1:n,a2=1:m,b2=1:n
            %Horz=1时，a1=1:m,b1=1:n-1,a2=1:m,b2=2:n
            %Horz=2时，a1=1:m,b1=3:n,a2=1:m,b2=1:n-2
            %当Horz=0：
            %Vert=-2时，a1=1:m-2,b1=1:n,a2=3:m,b2=1:n
            %Vert=-1时，a1=1:m-1,b1=1:n,a2=2:m,b2=1:n
            %Vert=0时，a1=1:m,b1=1:n,a2=1:m,b2=1:n
            %Vert=1时，a1=2:m,b1=1:n,a2=1:m-1,b2=1:n
            %Vert=2时，a1=3:m,b1=1:n,a2=1:m-2,b2=1:n
            %比较
            for a=1:m
                for b=1:n
                    if picgaborcode1(a,b)~=picgaborcode2(a,b)
                         diversitysum=diversitysum+1;
                    end
                end
            end
            
            hamming=diversitysum/(m*n);
            counthosp=counthosp+1;
            hosp(1,counthosp)=hamming;
        end
    end
end
save hosp hosp;      
 for i=1:fileNum/6-1%不同类手掌类间距离,fileNum/6组手掌
    for j=1:6
        for k=i*6+1:fileNum
             picgaborcode1=singletest((i-1)*6+j);
             picgaborcode2=singletest(k);
             [m,n]=size(picgaborcode1);
             diversitysum=0;
            for a=1:n
                if picgaborcode1(1,a)~=picgaborcode2(1,a)
                     diversitysum=diversitysum+1;
                end
            end
            hamming=diversitysum/(m*n);
            counthodp=counthodp+1;
            hodp(1,counthodp)=hamming;
        end
    end
end       
save hodp hodp;          
