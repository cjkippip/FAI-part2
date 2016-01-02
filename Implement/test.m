visited=cell(1,1);
%%
visited{1,1}=puz1;
visited{1,2}=puz2;
visited{1,3}=puz2;
%%
for i=1:length(visited)
    if ~isequal(puz1,visited{1,i})
        disp('sssss');
    end
end
%%
visited={};
%%
length(visited)
%%
N=4;
% Initial state
puz1=cell(N,N);
puz1(:,:)={' '};
puz1(4,4)={'G'};
puz1(4,1)={'A'};
puz1(4,2)={'B'};
puz1(4,3)={'C'};
startNode=node(puz1);
%%
stack=startNode;
stack_index = 1;

%%
AA = stack(1);
%%
stack_index = stack_index - 1;
%%
visited{1,length(visited)+1} = AA.state;
%%
stack(2) = startNode;
%%
startNode=node(startState);
%%
node2=moveUp(startNode);
%%
if isempty(node1.Parent)
    disp('sssss');
end
%%
tile={' ',' ',' ','A',...
    ' ',' ',' ','B',...
    ' ',' ',' ','C',...
    ' ',' ',' ','G'};
%%
state1=ones(N,N);
for i=1:N*N
    state1(i)=i;
end
%%
state2=state1;
%%
[row,col]=find(state1==4);
%%
visited={};
%%
node2=moveUp(startNode);
%%
visited{1,length(visited)+1} = startState;
%%
visited{1,length(visited)+1} = node2.State;
%%
flag=isVisited(startNode,visited);
%%
if 1~=2
    disp('sssss');
    disp('sssss');
end
%%
openList=[];
openListLength=length(openList);
%%
openList=startNode;
%%
openList(length(openList) + 1) = startNode;
%%
closList=startNode;
%%
closList(1)=[];
%%
closList(length(closList)+1)=startNode;
%%
showPath(path);
%%
A1=[0 0 0 0;0 1 0 0;0 2 0 0;0 3 0 4];
A2=sparse(A1);
B1=[0 0 0 0;0 1 0 0;0 2 0 4;0 3 0 0];
B2=sparse(B1);
%%
if ~isequal(A2,B2)
    disp('sssss');
end
%%
A=[0 0 0 0;0 1 0 0;0 2 0 0;0 3 0 4];
a=[0 3 0 4];
b=[1 0 0 0];
%%
ssss=ismember(a,A,'rows');
%%
openList=matix2decNum(startNode.State);
%%
if ~isequal(currNode.State,goalNode.State)
    disp('no solution');
end 
%%
tic
closList=[];
openList=startNode;
FCostList=[];
FCostList(1)=FCost1(startNode);
timeC=0; % time complexity
%%
currIndx=find(FCostList==min(FCostList));
    currNode=openList(currIndx);
%%
openListDec1=[1 2 3];
openListDec2=[1 2 4];
flag=0;
a=ismember(openListDec1,openListDec2);
b=ismember(1,a);
%%
closList1=[];
openList1=startNode;
openListDec1=matix2decNum(startNode.State);
FCostList1=FCost1(startNode);

closList2=[];
openList2=goalNode;
openListDec2=matix2decNum(goalNode.State);
FCostList2=FCost1(goalNode);
%%
    currIndxs=find(FCostList1==min(FCostList1));
    currIndx=currIndxs(1);
    currNode=openList1(currIndx);
    
    % show the process 
    currFCost=currNode.FCost;
    currGCost=currNode.GCost;
    currState=currNode.State;
    currFCost
    currGCost
    currState
    timeC=timeC+1;
    
    % Estimate if get the goalNode
    a=ismember(openListDec1,openListDec2);
    flag1=ismember(1,a);
    if flag1==1
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
    
    openList1(currIndx)=[];% delete current node
    openListDec1(currIndx)=[];
    FCostList1(currIndx)=[];
    
    % move current node's state(dec number) into close list
    closDecNum=matix2decNum(currNode.State);
    closList1(length(closList1)+1)=closDecNum;
 
    aroundNode=startNode;
    aroundNode(1)=[];% create a container to save around nodes.
%%      
    nodeAfterMoveUp = moveUp(currNode); % node after move up
    % if it can move (CantMove==0)
    if nodeAfterMoveUp.CantMove==0
        % if the state after moving is not a member of close list
        if (~ismember(matix2decNum(nodeAfterMoveUp.State),closList1))
            nodeAfterMoveUp.Parent = currNode; % parent node is current node           
            nodeAfterMoveUp.GCost = currNode.GCost + 1; 
            aroundNode(length(aroundNode)+1)=nodeAfterMoveUp;
        end
    end  
%%   
    nodeAfterMoveDown = moveDown(currNode); 
    if nodeAfterMoveDown.CantMove==0
        if (~ismember(matix2decNum(nodeAfterMoveDown.State),closList1))
            nodeAfterMoveDown.Parent = currNode;           
            nodeAfterMoveDown.GCost = currNode.GCost + 1; 
            aroundNode(length(aroundNode)+1)=nodeAfterMoveDown;
        end
    end 
%%   
    nodeAfterMoveLeft = moveLeft(currNode);
    if nodeAfterMoveLeft.CantMove==0
        if (~ismember(matix2decNum(nodeAfterMoveLeft.State),closList1))
            nodeAfterMoveLeft.Parent = currNode;         
            nodeAfterMoveLeft.GCost = currNode.GCost + 1; 
            aroundNode(length(aroundNode)+1)=nodeAfterMoveLeft;
        end
    end
%%      
    nodeAfterMoveRight = moveRight(currNode);
    if nodeAfterMoveRight.CantMove==0
        if (~ismember(matix2decNum(nodeAfterMoveRight.State),closList1))
            nodeAfterMoveRight.Parent = currNode;          
            nodeAfterMoveRight.GCost = currNode.GCost + 1; 
            aroundNode(length(aroundNode)+1)=nodeAfterMoveRight;
        end
    end    
%%    
    for i=1:length(aroundNode)
        if ~ismember(matix2decNum(aroundNode(i).State), openListDec1)
            aroundNode(i).FCost=FCost1(aroundNode(i));
            FCostList1(length(FCostList1)+1)=aroundNode(i).FCost;
            openList1(length(openList1)+1)=aroundNode(i);% add in open list 
            openListDec1(length(openListDec1)+1)=matix2decNum(aroundNode(i).State);
        end            
    end 



