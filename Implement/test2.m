a=zeros(N,N);
a(4,1)=1;
a(4,2)=2;
a(4,3)=3;
a(4,4)=4;

b=zeros(N,N);
b(4,1)=1;
b(4,2)=2;
b(4,3)=1;
b(4,4)=4;
%%
decNum1=matix2decNum(a);
decNum2=matix2decNum(b);
%%
if decNum1~=decNum2
    disp('sssss');
end









