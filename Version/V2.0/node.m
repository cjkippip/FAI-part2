classdef node
%{
Class node
Reference:https://github.com/Icarurs/matlab-8-puzzle/blob/master/puzzle.m
%}
    properties
        State
        Depth
        FCost
        GCost    
        CantMove
        Direction
        Parent
    end
%%    
    methods
        function nodeData=node(state)
            nodeData.State=state;
            nodeData.Depth=0;
            nodeData.FCost=0;
            nodeData.GCost=0;
            nodeData.CantMove=0;
            nodeData.Direction='none';
        end
             
        function obNode = moveUp(obNode)
            [row,col]=find(obNode.State==4);
            if row>=2 % in this condition, node can move
                obNode.State(row,col)=obNode.State(row-1,col);
                obNode.State(row-1,col)=4;
                obNode.Direction='Up';
            else % out of boundary, CantMove=1
                obNode.CantMove=1;
            end
        end 
           
        function obNode = moveDown(obNode)
            [row,col]=find(obNode.State==4);
            if row<=3
                obNode.State(row,col)=obNode.State(row+1,col);
                obNode.State(row+1,col)=4;
                obNode.Direction='Down';
            else
                obNode.CantMove=1;
            end
        end 
        
        function obNode = moveLeft(obNode)
            [row,col]=find(obNode.State==4);
            if col>=2
                obNode.State(row,col)=obNode.State(row,col-1);      
                obNode.State(row,col-1)=4;
                obNode.Direction='Left';
            else
                obNode.CantMove=1;
            end
        end 
        
        function obNode = moveRight(obNode)
            [row,col]=find(obNode.State==4);
            if col<=3
                obNode.State(row,col)=obNode.State(row,col+1);    
                obNode.State(row,col+1)=4;
                obNode.Direction='Right';
            else
                obNode.CantMove=1;
            end
        end         
    end   
end
