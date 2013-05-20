function [time,it,nextime,ev_list,NE]=ev_pop(ev_list,NE,tend)
%okreœlenie na podtawie listy ev_list najbli¿szej chwili time, w której nalezy wykonaæ analizê 
%zdarzeniom dla tej chwili zmienia sie status valid z 1 na 0
%liczbê zdarzeñ wa¿nych NE zmniejsza siê o 1.
for i=1:length(ev_list)
    if(ev_list(i).valid==1)
        it=i; time=ev_list(it).time; ev_list(it).valid=0; NE=NE-1; nextime=tend; if(it<length(ev_list)), nextime=ev_list(it+1).time; end;
        display(['najblizsza chwila do zdjecia zdarzen: indeks ',num2str(it),' czas ',num2str(time)])
        break;
    end
end

