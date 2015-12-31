function cost=FCost2(node)
%{ 
F = G + H.
%}
HCost=0;
if node.State(2,2)~=1
    HCost=HCost+3;
end

if node.State(3,2)~=2
    HCost=HCost+3;
end

if node.State(4,2)~=3
    HCost=HCost+3;
end

if node.State(4,4)~=4
    HCost=HCost+1;
end

% GCost=1+factor*(node.GCost-1);
GCost=node.GCost;

cost=GCost+HCost;
end


