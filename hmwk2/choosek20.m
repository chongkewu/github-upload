clear;
temp=0;
for i=0:20
    t1=nchoosek(120,i)*(0.9)^(120-i)*0.1^i;
    temp=temp+t1;
end
fprintf('result is %d',1-temp);