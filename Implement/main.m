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
% startState(4,1)=1;
% startState(4,2)=2;
% startState(4,3)=3;
% startState(4,4)=4;

% startState(4,4)=1;
% startState(1,1)=2;
% startState(1,4)=3;
% startState(2,1)=4;

startState(1,1)=1;
startState(1,3)=2;
startState(2,3)=3;
startState(2,1)=4;
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
% Depth-First Search Graph
% [depth, realTime, path] = DFS_Graph(startNode, goalNode);
%%
% Depth-First Search
% [depth, realTime, path] = DFS(startNode, goalNode);
%%
% Breadth-First Search Graph
% [depth, realTime, path] = BFS_Graph(startNode, goalNode);
%%
% Breadth-First Search 
% [depth, realTime, path] = BFS(startNode, goalNode);
%%
% Iterative-Deepening Search
% [depth, realTime, path] = IDS_Graph(startNode, goalNode);
%%
% A-Star Search
% [depth, realTime, path] = AStar(startNode, goalNode);
%%
tic
closList=[];
openList=startNode;

while ~isempty(openList)
    currIndx=1;
    currNode=openList(currIndx);
    
    % find the lowest FCost node in open list and set currNode as it.
    for i=1:length(openList)
        if openList(i).FCost<currNode.FCost
            currIndx=i;
            currNode=openList(currIndx);
        end
    end

    % show the process 
    currFCost=currNode.FCost;
    currGCost=currNode.GCost;
    currState=currNode.State;
    currFCost
    currGCost
    currState
    
    % Estimate if get the goalNode
    if currNode.State==goalNode.State
        path=backtrack(currNode); % backtrack the path of solution
        depth=currNode.Depth;        
        realTime=toc;
        disp('have solution');   
        return
    end
    
    openList(currIndx)=[];% delete current node
    closDecNum=matix2decNum(currNode.State);
    % move current node's state(dec number) into close list
    closList(length(closList)+1)=closDecNum;
    aroundNode=startNode;
    aroundNode(1)=[];% create a container to save around nodes.
%%      
    nodeAfterMoveUp = moveUp(currNode); % node after move up
    % if it can move(CantMove==0)
    if nodeAfterMoveUp.CantMove==0
        % if the state after moving is not a member of close list
        if (~ismember(matix2decNum(nodeAfterMoveUp.State),closList))
            nodeAfterMoveUp.Parent = currNode; % parent node is current node           
            nodeAfterMoveUp.GCost = currNode.GCost + 1; 
            aroundNode(length(aroundNode)+1)=nodeAfterMoveUp;
        end
    end  
%%   
    nodeAfterMoveDown = moveDown(currNode); 
    if nodeAfterMoveDown.CantMove==0
        if (~ismember(matix2decNum(nodeAfterMoveDown.State),closList))
            nodeAfterMoveDown.Parent = currNode;           
            nodeAfterMoveDown.GCost = currNode.GCost + 1; 
            aroundNode(length(aroundNode)+1)=nodeAfterMoveDown;
        end
    end 
%%   
    nodeAfterMoveLeft = moveLeft(currNode);
    if nodeAfterMoveLeft.CantMove==0
        if (~ismember(matix2decNum(nodeAfterMoveLeft.State),closList))
            nodeAfterMoveLeft.Parent = currNode;         
            nodeAfterMoveLeft.GCost = currNode.GCost + 1; 
            aroundNode(length(aroundNode)+1)=nodeAfterMoveLeft;
        end
    end
%%      
    nodeAfterMoveRight = moveRight(currNode);
    if nodeAfterMoveRight.CantMove==0
        if (~ismember(matix2decNum(nodeAfterMoveRight.State),closList))
            nodeAfterMoveRight.Parent = currNode;          
            nodeAfterMoveRight.GCost = currNode.GCost + 1; 
            aroundNode(length(aroundNode)+1)=nodeAfterMoveRight;
        end
    end    
%%    
    for i=1:length(aroundNode)
        flag=1;
        for j=1:length(openList)
            if aroundNode(i).State==openList(j).State
                flag=0;
            end
        end
        
        if flag==1% if node is not in open list
%             aroundNode(i).FCost=aroundNode(i).GCost+HCost2(aroundNode(i).State);
            aroundNode(i).FCost=FCost1(aroundNode(i));
            openList(length(openList)+1)=aroundNode(i);% add in open list
        end
    end 
end % while end
%%
if currNode.State~=goalNode.State
    path=backtrack(currNode);
    depth=currNode.Depth;        
    realTime=toc;
    disp('no solution');
end  


