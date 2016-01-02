%{
Fundation of AI coursework part 1
%}
clc
clear

N=4;
% 1=A, 2=B, 3=C, 4=G(Agent), 0=Blank
startNode=createStartNode(N);

% goal state
goalState=zeros(N,N);
goalState(2,2)=1;
goalState(3,2)=2;
goalState(4,2)=3;
goalState(4,4)=4;
goalNode=node(goalState);

%%
%{
Different search methods. Every first line is comment.
Every second line is code. Uncomment the code line to execute.
%}
%%
% Breadth-First Search 
% [depth, realTime, timeC, route] = BFS(startNode, goalNode);
%%
% Breadth-First Search Graph
% [depth, realTime, timeC, route] = BFS_Graph(startNode, goalNode);
%%
% Depth-First Search
% [depth, realTime, timeC, route] = DFS(startNode, goalNode);
%%
% Depth-Limited Search Graph
% [depth, realTime, timeC, route] = DLS(startNode, goalNode);
%%
% Iterative-Deepening Search
% [depth, realTime, timeC, route] = IDS(startNode, goalNode);
%%
% Iterative-Deepening Search Graph
% [depth, realTime, timeC, route] = IDS_Graph(startNode, goalNode);
%%
% A-Star Search Tree
% [depth, realTime, timeC, route] = AStar_Tree(startNode, goalNode);
%%
% A-Star Search Graph
% [depth, realTime, timeC, route] = AStar_Graph(startNode, goalNode);
%%
% Greedy Best-First Search
% [depth, realTime, timeC, route] = GBFS(startNode, goalNode);
%%



