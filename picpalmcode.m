PathRoot='C:\Users\hasee\Desktop\03Polyu_Pamprin\Polyu_Pamprint_600\';
list=dir(PathRoot);
fileNum=size(list); 
for k=1:fileNum-3 
    picgaborcode=singletest(k);
    newPathRoot='C:\Users\hasee\Desktop\03Polyu_Pamprin\palmcode\';%定义文件夹的路径。
    imwrite(picgaborcode,strcat(newPathRoot,list(k+2).name));
    disp(strcat(list(k+2).name,'文件写入成功！'));
end
