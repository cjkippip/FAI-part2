function startNode=createStartNode(N)

% start state
startState=zeros(N,N);

% diff=3
% startState(2,2)=1;
% startState(3,2)=2;
% startState(4,3)=3;
% startState(4,1)=4;

% diff=6
% startState(2,2)=1;
% startState(3,2)=2;
% startState(4,3)=3;
% startState(1,1)=4;

% diff=10
startState(2,1)=1;
startState(4,2)=2;
startState(4,3)=3;
startState(4,4)=4;

% diff=14
% startState(4,1)=1;
% startState(4,2)=2;
% startState(3,3)=3;
% startState(4,4)=4;

% diff=16(original)
% startState(4,1)=1;
% startState(4,2)=2;
% startState(4,3)=3;
% startState(4,4)=4;

% diff=18
% startState(4,1)=1;
% startState(4,2)=2;
% startState(3,1)=3;
% startState(4,4)=4;

% diff=20
% startState(4,1)=1;
% startState(4,2)=2;
% startState(2,3)=3;
% startState(4,4)=4;

% diff=21
% startState(1,1)=1;
% startState(1,3)=2;
% startState(2,3)=3;
% startState(2,1)=4;

% diff=24
% startState(4,1)=1;
% startState(4,2)=2;
% startState(1,3)=3;
% startState(4,4)=4;

% diff=29
% startState(4,4)=1;
% startState(1,1)=2;
% startState(1,4)=3;
% startState(2,1)=4;

startNode=node(startState);

end