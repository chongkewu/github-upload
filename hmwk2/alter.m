clear
a=textread('output.txt','%s');
string=a{1};
c_p=a{2};
n_s=size(string,2);
for i=1:n_s
    if string(i)=='1'
        string(i)='0';
        break;
    end
end
s_save={string;c_p};
% output
aa=cd;
fid=fopen([aa,'\','output.txt'],'wt');
for i=1:2
fprintf(fid,'%s\n',s_save{i});
end
fclose(fid);