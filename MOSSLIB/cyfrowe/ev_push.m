function [ev_list,NE]=ev_push(ev_list,NE,timenew,snew,vnew)
%funkcja wstawiajaca na ev_list chronologicznie i uaktualniajaca liczbe zdarzen
ev_add.time=timenew; ev_add.s=snew; ev_add.v=vnew; ev_add.valid=1;
for i=1:length(ev_list)
     if(ev_list(i).time==timenew)
            fl=0;
            for j=1:length(ev_list(i).s)
                if(ev_list(i).s(j)==snew), ev_list(i).v(j)=vnew; fl=1; break; end
            end
            if (fl==0), ev_list(i).s=[ev_list(i).s,snew]; ev_list(i).v=[ev_list(i).v,vnew]; end
            %wydruk pomocniczy wygenerowanego zdarzenia
            display(['czas wstawionego zdarzenia ', num2str(ev_list(i).time),' waznosc ',num2str(ev_list(i).valid),' sygnal nr ',num2str(snew),' wartoœæ ', num2str(vnew)]);
            return
     elseif(ev_list(i).time>timenew)
            ev_list=[ev_list(1:(i-1)),ev_add,ev_list(i:length(ev_list))]; NE=NE+1;
            %wydruk pomocniczy wygenerowanego zdarzenia
            display(['czas wstawionego zdarzenia ', num2str(ev_list(i).time),' waznosc ',num2str(ev_list(i).valid),' sygnal nr ',num2str(ev_list(i).s(length(ev_list(i).s))),' wartoœæ ', num2str(ev_list(i).v(length(ev_list(i).v)))]);   
            return
     end
 end
 ev_list=[ev_list(1:length(ev_list)),ev_add]; NE=NE+1; i=length(ev_list);
 display(['czas wstawionego zdarzenia ', num2str(ev_list(i).time),' waznosc ',num2str(ev_list(i).valid),' sygnal nr ',num2str(ev_list(i).s(length(ev_list(i).s))),' wartoœæ ', num2str(ev_list(i).v(length(ev_list(i).v)))]);