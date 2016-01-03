function path = backtrackOppo(node)
%{
Function: backtrack the opposite path of solution when execute
A-Star Bidirection Search
It is an array of nodes.
%}
    i = 1;  
    path = node;
    path(1) = [];
    while ~isempty(node.Parent)       
        if strcmp(node.Direction,'Up')
            node.Direction='Down';
        elseif strcmp(node.Direction,'Down')
            node.Direction='Up';
        elseif strcmp(node.Direction,'Left')
            node.Direction='Right';
        elseif strcmp(node.Direction,'Right')
            node.Direction='Left';
        end
        path(i) = node;
        node = node.Parent;
        i = i + 1;        
    end
    
    
end