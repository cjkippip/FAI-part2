%{
Fundation of AI coursework part 1
Breadth-First Search Graph
%}

function [depth, realTime, timeC, route] = BFS_Graph(startNode, goalNode)
tic
queue=startNode; % stack stores nodes that is unvisited
startNode.Parent=[];
visited={}; % null cell
indx=1;
timeC=0;
while indx <= length(queue)
    currNode=queue(indx);
    indx=indx + 1; 
    visited{1,length(visited)+1} = currNode.State; % add visited node
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
        depth
        realTime
        timeC
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
            queue(length(queue)+1)=nodeAfterMoveUp;
        end

        nodeAfterMoveDown = moveDown(currNode);
        flag=isVisited(nodeAfterMoveDown,visited);
        if(nodeAfterMoveDown.CantMove==0 && flag==0)
            nodeAfterMoveDown.Parent = currNode;
            nodeAfterMoveDown.Depth = currNode.Depth + 1;
            queue(length(queue)+1)=nodeAfterMoveDown;
        end  

        nodeAfterMoveLeft = moveLeft(currNode);
        flag=isVisited(nodeAfterMoveLeft,visited);
        if(nodeAfterMoveLeft.CantMove==0 && flag==0)
            nodeAfterMoveLeft.Parent = currNode;
            nodeAfterMoveLeft.Depth = currNode.Depth + 1;
            queue(length(queue)+1)=nodeAfterMoveLeft;
        end

        nodeAfterMoveRight = moveRight(currNode);
        flag=isVisited(nodeAfterMoveRight,visited);
        if(nodeAfterMoveRight.CantMove==0 && flag==0)
            nodeAfterMoveRight.Parent = currNode;
            nodeAfterMoveRight.Depth = currNode.Depth + 1;
            queue(length(queue)+1)=nodeAfterMoveRight;
        end
    end
end

%%
if ~isequal(currNode.State,goalNode.State)
    path=backtrack(currNode);
    depth=currNode.Depth;        
    realTime=toc;
    disp('no solution');
    return
end  
end