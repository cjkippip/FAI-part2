%{
Fundation of AI coursework 
Depth-First Search 
Reference: https://github.com/cjkippip/8-puzzle/blob/master/DFS.m
%}

function [depth, realTime, timeC, route] = DFS(startNode, goalNode)
tic
myStack=startNode; % stack stores nodes that is unvisited
indx=1; % index of stack
timeC=0; % time complexity
while indx > 0
    currNode=myStack(indx);
    indx=indx - 1; % remove visited node
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
        disp(['length of route: ',num2str(length(route))]);
        return
    elseif currNode.Depth>60000
        break;
    else % no depth limitation         
        randomNums=randperm(4);   
        for i=1:4
            switch(randomNums(i))
                case(1)
                    nodeAfterMoveUp = moveUp(currNode); % node after move up
                    % if it can move(CantMove==0)
                    if(nodeAfterMoveUp.CantMove==0)
                        nodeAfterMoveUp.Parent = currNode; % parent node is current node           
                        nodeAfterMoveUp.Depth = currNode.Depth + 1;
                        indx = indx + 1;
                        myStack(indx) = nodeAfterMoveUp; % push in stack            
                    end

                case(2)
                    nodeAfterMoveDown = moveDown(currNode);
                    if(nodeAfterMoveDown.CantMove==0)
                        nodeAfterMoveDown.Parent = currNode;
                        nodeAfterMoveDown.Depth = currNode.Depth + 1;
                        indx = indx + 1;
                        myStack(indx) = nodeAfterMoveDown;        
                    end  

                case(3)
                    nodeAfterMoveLeft = moveLeft(currNode);
                    if(nodeAfterMoveLeft.CantMove==0)
                        nodeAfterMoveLeft.Parent = currNode;
                        nodeAfterMoveLeft.Depth = currNode.Depth + 1;
                        indx = indx + 1;
                        myStack(indx) = nodeAfterMoveLeft;
                    end

                case(4)
                    nodeAfterMoveRight = moveRight(currNode);
                    if(nodeAfterMoveRight.CantMove==0)
                        nodeAfterMoveRight.Parent = currNode;
                        nodeAfterMoveRight.Depth = currNode.Depth + 1;
                        indx = indx + 1;
                        myStack(indx) = nodeAfterMoveRight;
                    end
            end % switch end
        end % for and
    end % if end
end % while end

%%

if ~isequal(currNode.State,goalNode.State)
    route='no solution';
    depth='no solution';    
    realTime=toc;
    disp('no solution');
    disp('Current node depth: no solution');
    disp('Actual time: no solution');
    disp('Time complexity: no solution');
end

end