%{
Foundation of AI coursework 
Breadth-First Search Graph
%}

function [depth, realTime, timeC, route] = BFS_Graph(startNode, goalNode)
tic
myQueue=startNode; % stack stores nodes that is unvisited
startNode.Parent=[];
visited=[]; % null vector
indx=1;
timeC=0; % time complexity
while indx <= length(myQueue)
    currNode=myQueue(indx);
    indx=indx + 1; 
    visitedDecNum=matix2decNum(currNode.State);
    visited(length(visited)+1) = visitedDecNum; % add visited node
    % show the process
    currDepth=currNode.Depth;
    currState=currNode.State;
    currDepth
    currState
    timeC=timeC+1;
%% 
    % Estimate if get the goalNode
    if currNode.State==goalNode.State
        path=backtrack(currNode); % backtrack the path of solution
        route=getRoute(path);      
        depth=currNode.Depth;  
        realTime=toc;
        disp('have solution');
        disp(['Current node depth: ',num2str(depth)]);
        disp(['Actual time: ',num2str(realTime)]);
        disp(['Time complexity: ',num2str(timeC)]);
        route
        return           
    else
        nodeAfterMoveUp = moveUp(currNode); % node after move up
        flag=isVisited(nodeAfterMoveUp,visited); % flag of isVisited
        % if it can move(CantMove==0) 
        % if it is not visited
        if(nodeAfterMoveUp.CantMove==0 && flag==0)
            nodeAfterMoveUp.Parent = currNode; % parent node is current node           
            nodeAfterMoveUp.Depth = currNode.Depth + 1;
            myQueue(length(myQueue)+1)=nodeAfterMoveUp;
        end

        nodeAfterMoveDown = moveDown(currNode);
        flag=isVisited(nodeAfterMoveDown,visited);
        if(nodeAfterMoveDown.CantMove==0 && flag==0)
            nodeAfterMoveDown.Parent = currNode;
            nodeAfterMoveDown.Depth = currNode.Depth + 1;
            myQueue(length(myQueue)+1)=nodeAfterMoveDown;
        end  

        nodeAfterMoveLeft = moveLeft(currNode);
        flag=isVisited(nodeAfterMoveLeft,visited);
        if(nodeAfterMoveLeft.CantMove==0 && flag==0)
            nodeAfterMoveLeft.Parent = currNode;
            nodeAfterMoveLeft.Depth = currNode.Depth + 1;
            myQueue(length(myQueue)+1)=nodeAfterMoveLeft;
        end

        nodeAfterMoveRight = moveRight(currNode);
        flag=isVisited(nodeAfterMoveRight,visited);
        if(nodeAfterMoveRight.CantMove==0 && flag==0)
            nodeAfterMoveRight.Parent = currNode;
            nodeAfterMoveRight.Depth = currNode.Depth + 1;
            myQueue(length(myQueue)+1)=nodeAfterMoveRight;
        end
    end
end

%%
if ~isequal(currNode.State,goalNode.State)
    path=backtrack(currNode);
    route=getRoute(path);
    depth=currNode.Depth;        
    realTime=toc;
    disp('no solution');
    return
end  
end