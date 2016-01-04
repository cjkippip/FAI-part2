%{
Fundation of AI coursework 
%}
clc
clear
N=4;
%{
Change start state to assess different method in different
difficulties. You can change the difficulty in function: createStartNode.
If the difficulty is more than 12, the programme will take a lot of time
to run. Because some inefficient methods(like BFS, DFS, LDF, IDS)
%}
startNode=createStartNode(N);

% goal state
% 1=A, 2=B, 3=C, 4=G(Agent), 0=Blank
goalState=zeros(N,N);
goalState(2,2)=1;
goalState(3,2)=2;
goalState(4,2)=3;
goalState(4,4)=4;
goalNode=node(goalState);

% Create a table to make result clear and easy to compare
table=cell(11,5);
% Row
table{2,1}='BFS';
table{3,1}='BFS_Graph';
table{4,1}='DFS';
table{5,1}='DLS';
table{6,1}='IDS';
table{7,1}='IDS_Graph';
table{8,1}='AStar_Tree';
table{9,1}='AStar_Graph';
table{10,1}='GBFS';
table{11,1}='AStarBi';
% Column
table{1,1}='Method';
table{1,2}='Depth';
table{1,3}='Real Time';
table{1,4}='Time Complexity';
table{1,5}='Route';
%%
% Breadth-First Search 
[depth, realTime, timeC, route] = BFS(startNode, goalNode);
table{2,2}=depth;
table{2,3}=realTime;
table{2,4}=timeC;
table{2,5}=route;
%%
% Breadth-First Search Graph
[depth, realTime, timeC, route] = BFS_Graph(startNode, goalNode);
table{3,2}=depth;
table{3,3}=realTime;
table{3,4}=timeC;
table{3,5}=route;
%%
% Depth-First Search
[depth, realTime, timeC, route] = DFS(startNode, goalNode);
table{4,2}=depth;
table{4,3}=realTime;
table{4,4}=timeC;
table{4,5}=route;
%%
% Depth-Limited Search Graph
[depth, realTime, timeC, route] = DLS(startNode, goalNode);
table{5,2}=depth;
table{5,3}=realTime;
table{5,4}=timeC;
table{5,5}=route;
%%
% Iterative-Deepening Search
[depth, realTime, timeC, route] = IDS(startNode, goalNode);
table{6,2}=depth;
table{6,3}=realTime;
table{6,4}=timeC;
table{6,5}=route;
%%
% Iterative-Deepening Search Graph
[depth, realTime, timeC, route] = IDS_Graph(startNode, goalNode);
table{7,2}=depth;
table{7,3}=realTime;
table{7,4}=timeC;
table{7,5}=route;
%%
% A-Star Search Tree
[depth, realTime, timeC, route] = AStar_Tree(startNode, goalNode);
table{8,2}=depth;
table{8,3}=realTime;
table{8,4}=timeC;
table{8,5}=route;
%%
% A-Star Search Graph
[depth, realTime, timeC, route] = AStar_Graph(startNode, goalNode);
table{9,2}=depth;
table{9,3}=realTime;
table{9,4}=timeC;
table{9,5}=route;
%%
% Greedy Best-First Search
[depth, realTime, timeC, route] = GBFS(startNode, goalNode);
table{10,2}=depth;
table{10,3}=realTime;
table{10,4}=timeC;
table{10,5}=route;
%%
% A-Star Bidirection Search
[depth, realTime, timeC, route] = AStarBi(startNode, goalNode);
table{11,2}=depth;
table{11,3}=realTime;
table{11,4}=timeC;
table{11,5}=route;
%%
% see the table in workspace, which contains results


