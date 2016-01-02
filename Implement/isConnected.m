function flag=isConnected(openListDec1,openListDec2)

a=ismember(openListDec1,openListDec2);
flag=ismember(1,a);

end