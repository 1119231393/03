picgaborcode1=singletest(21);
picgaborcode2=singletest(20);
[m,n]=size(picgaborcode1);
samesum=0;
for i=1:n
    if picgaborcode1(1,i)==picgaborcode2(1,i)
        samesum=samesum+1;
    end
end
if samesum/(m*n)>0.72
    disp('same');
else
    disp('different');
end