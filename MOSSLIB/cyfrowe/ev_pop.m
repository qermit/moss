function [time,it,nextime,ev_list,NE]=ev_pop(ev_list,NE,tend)
%okre�lenie na podtawie listy ev_list najbli�szej chwili time, w kt�rej nalezy wykona� analiz� 
%zdarzeniom dla tej chwili zmienia sie status valid z 1 na 0
%liczb� zdarze� wa�nych NE zmniejsza si� o 1.
for i=1:length(ev_list)
    if(ev_list(i).valid==1)
        it=i; time=ev_list(it).time; ev_list(it).valid=0; NE=NE-1; nextime=tend; if(it<length(ev_list)), nextime=ev_list(it+1).time; end;
        display(['najblizsza chwila do zdjecia zdarzen: indeks ',num2str(it),' czas ',num2str(time)])
        break;
    end
end

