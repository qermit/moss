function [s2p,p2s]=ev_initelem(NS,NP) 
for i=1:NS
    s2p(i).pr=[];    
end
for i=1:NP
    p2s(i).s=[];
    p2s(i).o=[];
    p2s(i).typ=[];
    p2s(i).delay=[];
end