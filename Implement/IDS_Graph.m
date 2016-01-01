%{
Fundation of AI coursework part 1
Iterative-Deepening Search Graph
%}

function [depth, realTime, timeC, route] = IDS_Graph(startNode, goalNode)
globalStartNode=startNode;
tic
timeC=0; % time complexity
for depthLimit=1:100000
    visited=[]; % null vector
    myStack=globalStartNode; % stack stores nodes that is unvisited
    indx=length(myStack); % index of stack
    endNodes=myStack;% last leaf nodes for every depth limitation 
    endNodesIndx=1;

    while indx > 0
        currNode=myStack(indx);
        indx=indx - 1; % remove visited node
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
        elseif(currNode.Depth<=depthLimit) % 1.with depth limitation
            nodeAfterMoveUp = moveUp(currNode); % node after move up
            flag=isVisited(nodeAfterMoveUp,visited); % flag of isVisited
            % if it can move(CantMove==0) 
            % if it is not visited
            if(nodeAfterMoveUp.CantMove==0 && flag==0)
                nodeAfterMoveUp.Parent = currNode; % parent node is current node           
                nodeAfterMoveUp.Depth = currNode.Depth + 1;
                indx = indx + 1;
                myStack(indx) = nodeAfterMoveUp; % push in stack            
            end

            nodeAfterMoveDown = moveDown(currNode);
            flag=isVisited(nodeAfterMoveDown,visited);
            if(nodeAfterMoveDown.CantMove==0 && flag==0)
                nodeAfterMoveDown.Parent = currNode;
                nodeAfterMoveDown.Depth = currNode.Depth + 1;
                indx = indx + 1;
                myStack(indx) = nodeAfterMoveDown;        
            end  

            nodeAfterMoveLeft = moveLeft(currNode);
            flag=isVisited(nodeAfterMoveLeft,visited);
            if(nodeAfterMoveLeft.CantMove==0 && flag==0)
                nodeAfterMoveLeft.Parent = currNode;
                nodeAfterMoveLeft.Depth = currNode.Depth + 1;
                indx = indx + 1;
                myStack(indx) = nodeAfterMoveLeft;
            end

            nodeAfterMoveRight = moveRight(currNode);
            flag=isVisited(nodeAfterMoveRight,visited);
            if(nodeAfterMoveRight.CantMove==0 && flag==0)
                nodeAfterMoveRight.Parent = currNode;
                nodeAfterMoveRight.Depth = currNode.Depth + 1;
                indx = indx + 1;
                myStack(indx) = nodeAfterMoveRight;
            end
        else
            endNodes(endNodesIndx) = currNode;
            endNodesIndx = endNodesIndx + 1;            
        end % if end
    end % while end
    globalStartNode=endNodes;
end % for end

%%
if ~isequal(currNode.State,goalNode.State)
    path=backtrack(currNode);
    route=getRoute(path);
    depth=currNode.Depth;        
    realTime=toc;
    disp('no solution');
end    
end
