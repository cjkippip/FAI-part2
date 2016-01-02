function flag=isVisited(nodeMove,visited)
%{
These function is uesd to estimate whether the node
after moving is visited.
%}
flag=0;
if ismember(matix2decNum(nodeMove.State),visited)
    flag=1; % flag=1 means visited.
    return
end
end