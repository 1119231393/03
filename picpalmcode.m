PathRoot='C:\Users\hasee\Desktop\03Polyu_Pamprin\Polyu_Pamprint_600\';
list=dir(PathRoot);
fileNum=size(list); 
for k=1:fileNum-3 
    picgaborcode=singletest(k);
    newPathRoot='C:\Users\hasee\Desktop\03Polyu_Pamprin\palmcode\';%�����ļ��е�·����
    imwrite(picgaborcode,strcat(newPathRoot,list(k+2).name));
    disp(strcat(list(k+2).name,'�ļ�д��ɹ���'));
end
