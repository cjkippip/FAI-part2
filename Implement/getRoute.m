function output=getRoute(path)
dRoute={};
for i=2:length(path)
    dRoute{length(dRoute)+1}=path(i).Direction;
end
output=dRoute;
end


