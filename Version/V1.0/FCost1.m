function cost=FCost1(node)
%{ 
F = G + H 
%}

node.GCost=1+factor*(node.GCost-1);

end

