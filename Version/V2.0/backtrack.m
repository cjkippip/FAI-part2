function path = backtrack(node)
%{
Function: backtrack the path of solution
It is an array of nodes.
%}
    i = 1;  
    path(i) = node;
    while ~isempty(node.Parent)
        node = node.Parent;
        i = i + 1;
        path(i) = node;
    end
    
    path = fliplr(path);
end