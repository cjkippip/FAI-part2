function cost=FCostBi(node,dynamicNode)
%{ 
F = G + H. Heuristic function Using Manhattan Distance 
to calculate the diffenece distences of 'A', 'B', 'C' and 'G'.
%}

[rowA,colA]=find(dynamicNode.State==1);
[rowB,colB]=find(dynamicNode.State==2);
[rowC,colC]=find(dynamicNode.State==3);
[rowG,colG]=find(dynamicNode.State==4);

% find the distance between current 1 and the goal 1.
[row1,col1]=find(node.State==1);
rowDiff1=abs(row1-rowA);
colDiff1=abs(col1-colA);
diff1=rowDiff1+colDiff1;

% find the distance between current 2 and the goal 2.
[row2,col2]=find(node.State==2);
rowDiff2=abs(row2-rowB);
colDiff2=abs(col2-colB);
diff2=rowDiff2+colDiff2;

% find the distance between current 3 and the goal 3.
[row3,col3]=find(node.State==3);
rowDiff3=abs(row3-rowC);
colDiff3=abs(col3-colC);
diff3=rowDiff3+colDiff3;

% find the distance between current 4 and the goal 4.
[row4,col4]=find(node.State==4);
rowDiff4=abs(row4-rowG);
colDiff4=abs(col4-colG);
diff4=rowDiff4+colDiff4;

% summary(H)
HCost=diff1+diff2+diff3+diff4;
% G
GCost=node.GCost;
% F = G + H
cost=GCost+HCost*(1+1/10000);
end


