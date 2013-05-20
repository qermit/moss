function [tt,wyj,s0]=ev_tran(s0,s2p,p2s,wymuszenia,nouts,tend,ncmax)
%inicjalizacja listy zdarzen przez wpisanie wymuszeñ
NE=0;
%wstawienie sygna³ów s0 na ev_list w chwili 0 jako wymuszenia
ev_list(1).s=1; ev_list(1).v=s0(1); ev_list(1).valid=1; ev_list(1).time=0;
display(['na ev_list wstawiono zainicjalizowany sygnal nr ',num2str(1),' o wartoœci ',num2str(s0(1))])
for i=2:length(s0)
    ev_list(1).s=[ev_list(1).s,i];
    ev_list(1).v=[ev_list(1).v,s0(i)];
    display(['na ev_list wstawiono zainicjalizowany sygnal nr ',num2str(i),' o wartoœci ',num2str(s0(i))])
end
NE=NE+1;

%wstawienie wszystkich wymuszeñ na ev_list
display('wstawianie wymuszen na ev_list');
for i=1:length(wymuszenia)
    for j=1:length(wymuszenia(i).s)
        [ev_list,NE]=ev_push(ev_list,NE,wymuszenia(i).time,wymuszenia(i).s(j),wymuszenia(i).v(j));
    end
end

ind=0;

while(NE>0)
display(['teraz liczba zdarzen do wykonania na ev_list wynosi ',num2str(NE)])

%okreœlenie najbli¿szej chwili i pozbawienie wa¿nosci zdarzeñ dla tej chwili
[time,it,nextime,ev_list,NE]=ev_pop(ev_list,NE,tend);
display(['w chwili ',num2str(time),' zdjêto z ev_list zdarzanie o indeksie ',num2str(it)])

%cykl delta dla bie¿¹cej chwili time, wymuszenia dla tej chwili brane z ev_list dla bie¿¹cej chwili
[ev_list,NE,s0,list_pd]=ev_delta(ev_list,NE,time,s0,s2p,p2s,it,ncmax);
display(['w chwili ',num2str(time),' zakonczono cykl delta']);
for i=1:length(s0), display(['s(',num2str(i),')=',num2str(s0(i))]), end

%gromadzenie sygna³ów wyjœciowych
ind=ind+1; tt(ind)=time; wyj(ind).v=s0(nouts);

%generacja zdarzeñ opoznionych
[ev_list,NE]=ev_gen(ev_list,NE,list_pd,p2s,s0,time,tend);
end