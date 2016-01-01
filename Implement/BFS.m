%{
Fundation of AI coursework part 1
Breadth-First Search
%}

function [depth, realTime, timeC, route] = BFS(startNode, goalNode)
tic
myQueue=startNode; % stack stores nodes that is unvisited
startNode.Parent=[];
indx=1;
timeC=0;
while indx <= length(myQueue)
    currNode=myQueue(indx);
    indx=indx + 1; 
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
        % if it can move(CantMove==0) 
        if(nodeAfterMoveUp.CantMove==0)
            nodeAfterMoveUp.Parent = currNode; % parent node is current node           
            nodeAfterMoveUp.Depth = currNode.Depth + 1;
            myQueue(length(myQueue)+1)=nodeAfterMoveUp;
        end

        nodeAfterMoveDown = moveDown(currNode);
        if(nodeAfterMoveDown.CantMove==0)
            nodeAfterMoveDown.Parent = currNode;
            nodeAfterMoveDown.Depth = currNode.Depth + 1;
            myQueue(length(myQueue)+1)=nodeAfterMoveDown;
        end  

        nodeAfterMoveLeft = moveLeft(currNode);
        if(nodeAfterMoveLeft.CantMove==0)
            nodeAfterMoveLeft.Parent = currNode;
            nodeAfterMoveLeft.Depth = currNode.Depth + 1;
            myQueue(length(myQueue)+1)=nodeAfterMoveLeft;
        end

        nodeAfterMoveRight = moveRight(currNode);
        if(nodeAfterMoveRight.CantMove==0)
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