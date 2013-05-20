function [s2p,p2s,wymuszenia,outs,NS,tbeg,tend]=ev_uklady(ncir,print)

tbeg=0;
if(ncir==1)
    %konw nkb na 1 z 2^2
    NS=8; NP=6; tend=3;
    [s2p,p2s]=ev_initelem(NS,NP); 
    [s2p,p2s]=ev_addelem(s2p,p2s,1,0,4,'ev_not',2);
    [s2p,p2s]=ev_addelem(s2p,p2s,2,0,3,'ev_not',1);
    [s2p,p2s]=ev_addelem(s2p,p2s,3,0,5,'ev_and',3,4);
    [s2p,p2s]=ev_addelem(s2p,p2s,4,0,6,'ev_and',1,4);
    [s2p,p2s]=ev_addelem(s2p,p2s,5,0,7,'ev_and',3,2);
    [s2p,p2s]=ev_addelem(s2p,p2s,6,0,8,'ev_and',1,2);
    wymuszenia=ev_initwym;
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,0,1,0,2,0);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,1,1,1,2,0);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,2,1,0,2,1);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,3,1,1,2,1);
    outs=[5,6,7,8]; 
elseif(ncir==2)
    %sumator 1 bitowy
    NS=8; NP=6; tend=3;
    [s2p,p2s]=ev_initelem(NS,NP); 
    [s2p,p2s]=ev_addelem(s2p,p2s,1,0,3,'ev_not',1);
    [s2p,p2s]=ev_addelem(s2p,p2s,2,0,4,'ev_not',2);
    [s2p,p2s]=ev_addelem(s2p,p2s,3,0,5,'ev_and',3,2);
    [s2p,p2s]=ev_addelem(s2p,p2s,4,0,6,'ev_and',1,4);
    [s2p,p2s]=ev_addelem(s2p,p2s,5,0,7,'ev_or ',5,6);
    [s2p,p2s]=ev_addelem(s2p,p2s,6,0,8,'ev_and',1,2);
    wymuszenia=ev_initwym;
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,0,1,0,2,0);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,1,1,0,2,1);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,2,1,1,2,1);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,3,1,1,2,0);
    outs=[7,8]; %7 suma 8 przeniesienie
elseif(ncir==3)
    %uk³ad and-not
    NS=4; NP=2; tend=5;
    [s2p,p2s]=ev_initelem(NS,NP); 
    [s2p,p2s]=ev_addelem(s2p,p2s,1,0,3,'ev_and',1,2);
    [s2p,p2s]=ev_addelem(s2p,p2s,2,2,4,'ev_not',3);
    wymuszenia=ev_initwym;
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,0,1,0,2,0);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,1,1,1,2,1);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,2,1,0,2,1);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,3,1,1,2,0);
    outs=[4];
elseif(ncir==4)
    %uk³ad z wlasnym procesem
    NS=5; NP=1; tend=3;
    [s2p,p2s]=ev_initelem(NS,NP); 
    [s2p,p2s]=ev_addelem(s2p,p2s,1,1,4,5,'ev_moj1',1,2,3);
    wymuszenia=ev_initwym;
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,0,1,0,2,0,3,0);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,1,1,1,2,0,3,1);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,2,1,1,2,1,3,1);
    outs=[4,5];
elseif(ncir==5)
    %uk³ad z hazardem
    NS=3; NP=2; tend=3;
    [s2p,p2s]=ev_initelem(NS,NP); 
    [s2p,p2s]=ev_addelem(s2p,p2s,1,0,3,'ev_and',1,2);
    [s2p,p2s]=ev_addelem(s2p,p2s,2,1,2,'ev_not',1);
    wymuszenia=ev_initwym;
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,0,1,0);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,1,1,1);
    outs=[3];
elseif(ncir==6)
    %uk³ad latch
    NS=3; NP=1; tend=4;
    [s2p,p2s]=ev_initelem(NS,NP); 
    [s2p,p2s]=ev_addelem(s2p,p2s,1,0,3,'ev_latch',1,2);
    wymuszenia=ev_initwym;
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,0,1,1,2,0);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,1,1,0,2,1);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,2,1,1,2,1);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,3,1,0,2,0);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,4,1,1,2,1)
    outs=[2,1,3];
elseif(ncir==7)
    %uk³ad fflop
    NS=3; NP=1; tend=5;
    [s2p,p2s]=ev_initelem(NS,NP); 
    [s2p,p2s]=ev_addelem(s2p,p2s,1,0,3,'ev_fflop',-1,2);
    wymuszenia=ev_initwym;
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,0,1,1,2,0);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,1,1,0,2,1);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,2,1,1,2,1);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,3,1,0,2,0);
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,4,1,1,2,1);
    outs=[2,1,3];
elseif(ncir==8)
    %uk³ad not-not, start od zer na wezlach
    NS=3; NP=2; tend=4;
    [s2p,p2s]=ev_initelem(NS,NP); 
    [s2p,p2s]=ev_addelem(s2p,p2s,1,1,2,'ev_not',1);
    [s2p,p2s]=ev_addelem(s2p,p2s,2,1,3,'ev_not',2);
    wymuszenia=ev_initwym;
    wymuszenia=ev_addwym(wymuszenia,tbeg,tend,1,1,1);
    outs=[1,2,3];  
end

if(print==0), return; end;

%wydruk pomocniczy
display('wymuszenia:')
for i=1:length(wymuszenia)
    display(['time=',num2str(wymuszenia(i).time),' sygna³y:'])
    wymuszenia(i).s
    display(['time=',num2str(wymuszenia(i).time),' wartosci:'])
    wymuszenia(i).v
end
display('listy powiazane uk³adu:')
for i=1:NS
display(['sygnal ',num2str(i),' procesy: '])
s2p(i).pr
end
for i=1:NP
display(['proces ',num2str(i),' nins: '])
p2s(i).s
display(['proces ',num2str(i),' outs: '])
p2s(i).o
display(['proces ',num2str(i),' typ: ',p2s(i).typ])
display(['proces ',num2str(i),' delay: ',num2str(p2s(i).delay)])
end
outs