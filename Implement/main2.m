%{
Foundation of AI coursework 
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
table=cell(7,5);
% Row
table{2,1}='AStar_F1';
table{3,1}='AStar_F2';
table{4,1}='AStar_F3';
table{5,1}='AStar_F4';
table{6,1}='AStar_Euc';
table{7,1}='AStar_Cheb';

% Column
table{1,1}='Method';
table{1,2}='Depth';
table{1,3}='Real Time';
table{1,4}='Time Complexity';
table{1,5}='Route';
%%
% A-Star Search FCost1
[depth, realTime, timeC, route] = AStar_F1(startNode, goalNode);
table{2,2}=depth;
table{2,3}=realTime;
table{2,4}=timeC;
table{2,5}=route;
%%
% A-Star Search FCost2
[depth, realTime, timeC, route] = AStar_F2(startNode, goalNode);
table{3,2}=depth;
table{3,3}=realTime;
table{3,4}=timeC;
table{3,5}=route;
%%
% A-Star Search FCost3
[depth, realTime, timeC, route] = AStar_F3(startNode, goalNode);
table{4,2}=depth;
table{4,3}=realTime;
table{4,4}=timeC;
table{4,5}=route;
%%
% A-Star Search FCost4
[depth, realTime, timeC, route] = AStar_F4(startNode, goalNode);
table{5,2}=depth;
table{5,3}=realTime;
table{5,4}=timeC;
table{5,5}=route;
%%
% A-Star Search Euclidean Distance
[depth, realTime, timeC, route] = AStar_Euc(startNode, goalNode);
table{6,2}=depth;
table{6,3}=realTime;
table{6,4}=timeC;
table{6,5}=route;
%%
% A-Star Search Chebyshev Distance
[depth, realTime, timeC, route] = AStar_Cheb(startNode, goalNode);
table{7,2}=depth;
table{7,3}=realTime;
table{7,4}=timeC;
table{7,5}=route;
