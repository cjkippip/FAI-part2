%{
Fundation of AI coursework part 1
%}
clc
clear

N=4;
% tile(1)='A',tile(2)='B',tile(3)='C',tile(4)='G'
tile={'A','B','C','G'};

% start state
% 1=A, 2=B, 3=C, 4=G(Agent), 0=Blank
startState=zeros(N,N);

% original diff=
% startState(4,1)=1;
% startState(4,2)=2;
% startState(4,3)=3;
% startState(4,4)=4;

% diff=12
% startState(4,4)=1;
% startState(1,1)=2;
% startState(1,4)=3;
% startState(2,1)=4;

% diff=8
% startState(1,1)=1;
% startState(1,3)=2;
% startState(2,3)=3;
% startState(2,1)=4;

% diff=2
startState(2,2)=1;
startState(3,2)=2;
startState(4,3)=3;
startState(1,1)=4;
startNode=node(startState);

% goal state
goalState=zeros(N,N);
goalState(2,2)=1;
goalState(3,2)=2;
goalState(4,2)=3;
goalState(4,4)=4;
goalNode=node(goalState);

% show start and goal state
startState
goalState

%%
%{
Different search methods. Every first line is comment.
Every second line is code. Uncomment the code line to execute.
%}
%%
% Depth-First Search
% [depth, realTime, timeC, route] = DFS(startNode, goalNode);
%%
% Depth-First Search Graph
% [depth, realTime, timeC, route] = DFS_Graph(startNode, goalNode);
%%
% Breadth-First Search 
% [depth, realTime, timeC, route] = BFS(startNode, goalNode);
%%
% Breadth-First Search Graph
% [depth, realTime, timeC, route] = BFS_Graph(startNode, goalNode);
%%
% Iterative-Deepening Search
% [depth, realTime, timeC, route] = IDS(startNode, goalNode);
%%
% Iterative-Deepening Search Graph
% [depth, realTime, timeC, route] = IDS_Graph(startNode, goalNode);
%%
% A-Star Search
% [depth, realTime, timeC, route] = AStar(startNode, goalNode);
%%

