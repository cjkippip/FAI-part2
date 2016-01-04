function cost=FCostEuc(node)
%{ 
F = G + H. Heuristic function Using Manhattan Distance 
to calculate the diffenece distences of 'A', 'B', 'C' and 'G'.
%}

% find the distance between current 1 and the goal 1.
[row1,col1]=find(node.State==1);
rowDiff1=abs(row1-2);
colDiff1=abs(col1-2);
diff1=sqrt(rowDiff1^2+colDiff1^2);

% find the distance between current 2 and the goal 2.
[row2,col2]=find(node.State==2);
rowDiff2=abs(row2-3);
colDiff2=abs(col2-2);
diff2=sqrt(rowDiff2^2+colDiff2^2);

% find the distance between current 3 and the goal 3.
[row3,col3]=find(node.State==3);
rowDiff3=abs(row3-4);
colDiff3=abs(col3-2);
diff3=sqrt(rowDiff3^2+colDiff3^2);

% find the distance between current 4 and the goal 4.
[row4,col4]=find(node.State==4);
rowDiff4=abs(row4-4);
colDiff4=abs(col4-4);
diff4=sqrt(rowDiff4^2+colDiff4^2);

% summary(H)
HCost=diff1+diff2+diff3+diff4;
% G
GCost=node.GCost;
% F = G + H
cost=GCost+HCost;

end