function [hamming]=hammingcompare(picnumber1,picnumber2)
PathRoot='C:\Users\hasee\Desktop\03Polyu_Pamprin\palmcode\';
list=dir(strcat(PathRoot,'*.bmp'));%��ȡ�ļ���Ŀ¼������.bmp�ļ���
            picgaborcode1=imread(strcat(PathRoot,list(picnumber1).name));%������ʽ����
            picgaborcode2=imread(strcat(PathRoot,list(picnumber2).name));
            [m,n]=size(picgaborcode1);
            diversitysum=0;
            %Horz��ʾͼ1ˮƽƽ�ƣ�-1��ʾ��ƽ��1��-2��ʾ��ƽ��2��0��ʾ��ƽ�ƣ�1��ʾ��ƽ��1��2��ʾ��ƽ��2
            %Vert��ʾͼ1��ֱƽ�ƣ�-1��ʾ��ƽ��1��-2��ʾ��ƽ��2��0��ʾ��ƽ�ƣ�1��ʾ��ƽ��1��2��ʾ��ƽ��2
            %�Ƚ�
            
            hamming=1;
            for horz=-2:2
                for vert=-2:2
                    for a=1:m-abs(vert)
                        for b=1:n-abs(horz)
                            if horz==0||horz>0
                                b1=b;
                                b2=b+abs(horz);
                            end
                            if horz<0
                                b1=b+abs(horz);
                                b2=b;
                            end
                            if vert==0||vert>0
                                a1=a+abs(vert);
                                a2=a;
                            end
                            if vert<0
                                a1=a;
                                a2=a+abs(vert);
                            end
                            if picgaborcode1(a1,b1)~=picgaborcode2(a2,b2)
                                     diversitysum=diversitysum+1;
                            end
                            
                        end
                    end
                    if hamming>diversitysum/((m-abs(vert))*(n-abs(horz)))
                        hamming=diversitysum/((m-abs(vert))*(n-abs(horz)));
                    end
                    diversitysum=0;
                end
            end
%             for horz=-2:2
%                 for vert=-2:2
%                 TTable=bitxor(picgaborcode1(2:3,1:2),picgaborcode2(2:3,1:2));
%                 TTable=(TTable~=0);
%                 diversitysum=sum(TTable(:));
%                 hamming1=diversitysum/((m-abs(vert))*(n-abs(horz)));
%                 end
%             end
%  
 
 