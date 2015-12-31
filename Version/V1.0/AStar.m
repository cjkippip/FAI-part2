%{
Fundation of AI coursework part 1
A-Star Search
primary
%}

function [depth, realTime, path] = AStar(startNode, goalNode)
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
            aroundNode(i).FCost=aroundNode(i).GCost+HCost(aroundNode(i).State);
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
end 


