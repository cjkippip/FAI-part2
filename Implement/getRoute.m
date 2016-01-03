function output=getRoute(path)
%{
Function: get the route of solution
It's an array of directions
%}
dRoute={};
for i=1:length(path)
    dRoute{length(dRoute)+1}=path(i).Direction;
end
output=dRoute;
end


