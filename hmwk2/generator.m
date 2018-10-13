clear;
% name=uigetfile('*.txt');
% a=textread(name,'%s');
a=textread('input.txt','%s');
string=a{1};
c_p=a{2};
% remove extra 0 from c_p
n_c=size(c_p,2);

c_p_temp = c_p;
for i=1:n_c
    if c_p(i) == '1'
        break;
    else
        c_p_temp = c_p(i+1:n_c);
    end
end
c_p=c_p_temp;
n_c=size(c_p,2);
% begin division
% add 0s
tail_0=zeros(1,n_c-1);
for i=1:n_c-1
    tail_0(i)='0';
end
tail_0=char(tail_0);
string=[string,tail_0];
n_s=size(string,2);
% divison
ind_start=1;
ind_stop=n_c;
for i=1:n_s
    if string(i) == '1'
        break;
    else
        ind_start=ind_start+1;
        ind_stop=ind_stop+1;
    end
end
string_c=string(ind_start:ind_stop);
rem=zeros(1,n_c);
for k=1:n_s
for i=1:n_c
    rem(i)=num2str(xor(str2double(c_p(i)),str2double(string_c(i))));
end
rem=char(rem);
% remove the leading 0s of rem
rem_temp=rem;
for i=1:n_c
    if rem(i)=='1'
        break;
    else
        rem_temp=rem(i+1:n_c);
        ind_start=ind_start+1;
        ind_stop=ind_stop+1;
    end
end
if ind_stop <= n_s
    rem=[rem_temp,string(ind_start+size(rem_temp,2):ind_stop)];
else
    for i=1:n_c
        if rem(i)=='1'
            break;
        else
            rem_temp=rem(i+1:n_c);
        end
    end
    rem=[rem_temp,string(ind_start+size(rem_temp,2):end)];
    break;
end
string_c=rem;
end
% catch rem to the string
OR_rem=zeros(1,size(rem,2));
for i=1:size(rem,2)
    OR_rem(i)=num2str(xor(str2double(rem(i)),0));
end
OR_rem=char(OR_rem);
string_out=[string(1:end-size(rem,2)),OR_rem];
s_save={string_out;c_p};
% output
aa=cd;
fid=fopen([aa,'\','output.txt'],'wt');
for i=1:2
fprintf(fid,'%s\n',s_save{i});
end
fclose(fid);