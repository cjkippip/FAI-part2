%{
Fundation of AI coursework 
A-Star Search Graph
%}

function [depth, realTime, timeC, route] = AStar_F4(startNode, goalNode)
tic
closList=[];
openList=startNode;
openListDec=matix2decNum(startNode.State);
FCostList=FCost1(startNode);
timeC=0; % time complexity
while ~isempty(openList)
    
    % find the lowest FCost node in open list and set currNode as it.
    currIndxs=find(FCostList==min(FCostList));
    currIndx=currIndxs(1);
    currNode=openList(currIndx);
    
    % show the process 
    currFCost=currNode.FCost;
    currGCost=currNode.GCost;
    currState=currNode.State;
    currFCost
    currGCost
    currState
    timeC=timeC+1;
    % Estimate if get the goalNode
    if currNode.State==goalNode.State
        path=backtrack(currNode); % backtrack the path of solution
        route=getRoute(path);
        depth=currNode.GCost;        
        realTime=toc;
        disp('have solution'); 
        disp(['Current node depth: ',num2str(depth)]);
        disp(['Actual time: ',num2str(realTime)]);
        disp(['Time complexity: ',num2str(timeC)]);
        route
        return
    end
    
    % delete current node
    openList(currIndx)=[];
    openListDec(currIndx)=[];
    FCostList(currIndx)=[];
    
    % move current node's state(dec number) into close list
    closDecNum=matix2decNum(currNode.State);
    closList(length(closList)+1)=closDecNum;
    
    aroundNode=startNode;
    aroundNode(1)=[];% create a container to save around nodes.
%%      
    nodeAfterMoveUp = moveUp(currNode); % node after move up
    % if it can move (CantMove==0)
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
        if ~ismember(matix2decNum(aroundNode(i).State), openListDec)
            aroundNode(i).FCost=FCost4(aroundNode(i));
            FCostList(length(FCostList)+1)=aroundNode(i).FCost;
            openList(length(openList)+1)=aroundNode(i);% add in open list 
            openListDec(length(openList)+1)=matix2decNum(aroundNode(i).State);
        end            
    end 
end % while end

%%
if ~isequal(currNode.State,goalNode.State)
    path=backtrack(currNode);
    route=getRoute(path);
    depth=currNode.Depth;        
    realTime=toc;
    disp('no solution');
end  
end 