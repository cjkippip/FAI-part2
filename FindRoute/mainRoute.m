%{
Fundation of AI coursework Find Route
%}
clc
clear

goalState=zeros(N,N);
goalState(2,2)=1;
goalState(3,2)=2;
goalState(4,2)=3;
goalState(4,4)=4;
goalNode=node(goalState);