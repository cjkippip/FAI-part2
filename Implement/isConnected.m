function [flag,closIndx1,closIndx2]=isConnected(closListDec1,closListDec2)
flag=0;
closIndx1=0;
closIndx2=0;
for i=1:length(closListDec1)
    for j=1:length(closListDec2)
        if closListDec1(i)==closListDec2(j)
        flag=1;
        closIndx1=i;
        closIndx2=j;
        return
        end
    end
end
end