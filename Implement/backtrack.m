function path = backtrack(node)
%{
Function: backtrack the path of solution
It is an array of nodes.
%}
    i = 1;  
    path = node;
    path(1) = [];
    while ~isempty(node.Parent)
        path(i) = node;
        node = node.Parent;
        i = i + 1;        
    end
    
    path = fliplr(path);
end