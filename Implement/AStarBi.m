
%{
Foundation of AI coursework
A-Star Bidirection Search
These method has two directions to search, but they are not concurrent.
They are alternant.
%}

function [depth, realTime, timeC, route] = AStarBi(startNode, goalNode)
tic
timeC=0; % time complexity

closListDec1=[];
closList1=startNode;
closList1(1)=[];

openList1=startNode;
openListDec1=matix2decNum(startNode.State);
FCostList1=FCost1(startNode);

closListDec2=[];
closList2=goalNode;
closList2(1)=[];

openList2=goalNode;
openListDec2=matix2decNum(goalNode.State);
FCostList2=FCost1(goalNode);



while (~isempty(openList1) || ~isempty(openList1))
    % positive direction
    
    dynamicIndxs1=find(FCostList2==min(FCostList2));
    dynamicIndx1=dynamicIndxs1(1);
    dynamicNode1=openList2(dynamicIndx1);
    
    % find the lowest FCost node in open list and set currNode as it.
    currIndxs1=find(FCostList1==min(FCostList1));
    currIndx1=currIndxs1(1);
    currNode1=openList1(currIndx1);
    
    % show the process 
    currFCost1=currNode1.FCost;
    currGCost1=currNode1.GCost;
    currState1=currNode1.State;
    currFCost1
    currGCost1
    currState1
    
    timeC=timeC+1;
    
    % Estimate if get the goalNode
    [flag1, closIndx1, closIndx2]=isConnected(closListDec1, closListDec2);
    if flag1==1
        % backtrack the path of positive solution
        path1=backtrack(closList1(closIndx1)); 
        route1=getRoute(path1);
        depth1=currNode1.GCost;  
        % backtrack the path of negative solution
        path2=backtrackOppo(closList2(closIndx2)); 
        route2=getRoute(path2);
        depth2=currNode2.GCost;  
        
        realTime=toc;
        disp('have solution');
        depth=depth1+depth2;
        route=[route1 route2];%combine route
        disp(['Current node depth: ',num2str(depth)]);
        disp(['Actual time: ',num2str(realTime)]);
        disp(['Time complexity: ',num2str(timeC)]);
        route
        return
    end
    
    openList1(currIndx1)=[];% delete current node
    openListDec1(currIndx1)=[];
    FCostList1(currIndx1)=[];
    
    % move current node's state(dec number) into close list
    closList1(length(closList1)+1)=currNode1;
    closDecNum1=matix2decNum(currNode1.State);
    closListDec1(length(closListDec1)+1)=closDecNum1;
 
    aroundNode1=startNode;
    aroundNode1(1)=[];% create a container to save around nodes.
%%      
    nodeAfterMoveUp1 = moveUp(currNode1); % node after move up
    % if it can move (CantMove==0)
    if nodeAfterMoveUp1.CantMove==0
        % if the state after moving is not a member of close list
        if (~ismember(matix2decNum(nodeAfterMoveUp1.State),closListDec1))
            nodeAfterMoveUp1.Parent = currNode1; % parent node is current node           
            nodeAfterMoveUp1.GCost = currNode1.GCost + 1; 
            aroundNode1(length(aroundNode1)+1)=nodeAfterMoveUp1;
        end
    end  
%%   
    nodeAfterMoveDown1 = moveDown(currNode1); 
    if nodeAfterMoveDown1.CantMove==0
        if (~ismember(matix2decNum(nodeAfterMoveDown1.State),closListDec1))
            nodeAfterMoveDown1.Parent = currNode1;           
            nodeAfterMoveDown1.GCost = currNode1.GCost + 1; 
            aroundNode1(length(aroundNode1)+1)=nodeAfterMoveDown1;
        end
    end 
%%   
    nodeAfterMoveLeft1 = moveLeft(currNode1);
    if nodeAfterMoveLeft1.CantMove==0
        if (~ismember(matix2decNum(nodeAfterMoveLeft1.State),closListDec1))
            nodeAfterMoveLeft1.Parent = currNode1;         
            nodeAfterMoveLeft1.GCost = currNode1.GCost + 1; 
            aroundNode1(length(aroundNode1)+1)=nodeAfterMoveLeft1;
        end
    end
%%      
    nodeAfterMoveRight1 = moveRight(currNode1);
    if nodeAfterMoveRight1.CantMove==0
        if (~ismember(matix2decNum(nodeAfterMoveRight1.State),closListDec1))
            nodeAfterMoveRight1.Parent = currNode1;          
            nodeAfterMoveRight1.GCost = currNode1.GCost + 1; 
            aroundNode1(length(aroundNode1)+1)=nodeAfterMoveRight1;
        end
    end    
%%    
    for i=1:length(aroundNode1)
        if ~ismember(matix2decNum(aroundNode1(i).State), openListDec1)
            aroundNode1(i).FCost=FCostBi(aroundNode1(i),dynamicNode1);
            FCostList1(length(FCostList1)+1)=aroundNode1(i).FCost;
            openList1(length(openList1)+1)=aroundNode1(i);% add in open list 
            openListDec1(length(openListDec1)+1)=matix2decNum(aroundNode1(i).State);
        end            
    end 
%% 
    % negative direction
    
    dynamicIndxs2=find(FCostList1==min(FCostList1));
    dynamicIndx2=dynamicIndxs2(1);
    dynamicNode2=openList1(dynamicIndx2);
 
    % find the lowest FCost node in open list and set currNode as it.
    currIndxs2=find(FCostList2==min(FCostList2));
    currIndx2=currIndxs2(1);
    currNode2=openList2(currIndx2);
    
    % show the process 
    currFCost2=currNode2.FCost;
    currGCost2=currNode2.GCost;
    currState2=currNode2.State;
    currFCost2
    currGCost2
    currState2
    
    timeC=timeC+1;
    
    % Estimate if get the goalNode
    [flag2, closIndx1, closIndx2]=isConnected(closListDec1, closListDec2);
    if flag2==1
        % backtrack the path of positive solution
        path1=backtrack(closList1(closIndx1)); 
        route1=getRoute(path1);
        depth1=currNode1.GCost;  
        % backtrack the path of negative solution
        path2=backtrackOppo(closList2(closIndx2)); 
        route2=getRoute(path2);
        depth2=currNode2.GCost;  
        
        realTime=toc;
        disp('have solution');
        depth=depth1+depth2;
        route=[route1 route2];% combine route
        disp(['Current node depth: ',num2str(depth)]);
        disp(['Actual time: ',num2str(realTime)]);
        disp(['Time complexity: ',num2str(timeC)]);
        route
        return
    end
    
    openList2(currIndx2)=[];% delete current node
    openListDec2(currIndx2)=[];
    FCostList2(currIndx2)=[];
    
    % move current node's state(dec number) into close list
    closList2(length(closList2)+1)=currNode2;
    closDecNum2=matix2decNum(currNode2.State);
    closListDec2(length(closListDec2)+1)=closDecNum2;
 
    aroundNode2=startNode;
    aroundNode2(1)=[];% create a container to save around nodes.
%%      
    nodeAfterMoveUp2 = moveUp(currNode2); % node after move up
    % if it can move (CantMove==0)
    if nodeAfterMoveUp2.CantMove==0
        % if the state after moving is not a member of close list
        if (~ismember(matix2decNum(nodeAfterMoveUp2.State),closListDec2))
            nodeAfterMoveUp2.Parent = currNode2; % parent node is current node           
            nodeAfterMoveUp2.GCost = currNode2.GCost + 1; 
            aroundNode2(length(aroundNode2)+1)=nodeAfterMoveUp2;
        end
    end  
%%   
    nodeAfterMoveDown2 = moveDown(currNode2); 
    if nodeAfterMoveDown2.CantMove==0
        if (~ismember(matix2decNum(nodeAfterMoveDown2.State),closListDec2))
            nodeAfterMoveDown2.Parent = currNode2;           
            nodeAfterMoveDown2.GCost = currNode2.GCost + 1; 
            aroundNode2(length(aroundNode2)+1)=nodeAfterMoveDown2;
        end
    end 
%%   
    nodeAfterMoveLeft2 = moveLeft(currNode2);
    if nodeAfterMoveLeft2.CantMove==0
        if (~ismember(matix2decNum(nodeAfterMoveLeft2.State),closListDec2))
            nodeAfterMoveLeft2.Parent = currNode2;         
            nodeAfterMoveLeft2.GCost = currNode2.GCost + 1; 
            aroundNode2(length(aroundNode2)+1)=nodeAfterMoveLeft2;
        end
    end
%%      
    nodeAfterMoveRight2 = moveRight(currNode2);
    if nodeAfterMoveRight2.CantMove==0
        if (~ismember(matix2decNum(nodeAfterMoveRight2.State),closListDec2))
            nodeAfterMoveRight2.Parent = currNode2;          
            nodeAfterMoveRight2.GCost = currNode2.GCost + 1; 
            aroundNode2(length(aroundNode2)+1)=nodeAfterMoveRight2;
        end
    end    
%%    
    for i=1:length(aroundNode2)
        if ~ismember(matix2decNum(aroundNode2(i).State), openListDec2)
            aroundNode2(i).FCost=FCostBi(aroundNode2(i),dynamicNode2);
            FCostList2(length(FCostList2)+1)=aroundNode2(i).FCost;
            openList2(length(openList2)+1)=aroundNode2(i);% add in open list 
            openListDec2(length(openListDec2)+1)=matix2decNum(aroundNode2(i).State);
        end            
    end   
end % while end

end 

