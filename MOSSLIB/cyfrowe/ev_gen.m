function [ev_list,NE]=ev_gen(ev_list,NE,list_pd,p2s,s0,time,tend)
npd=length(list_pd);
while(npd>0)
    %zdj�cie procesu z listy proces�w opoznionych list_pd
    p=list_pd(length(list_pd)).p; pi=list_pd(length(list_pd)).pi; vi=list_pd(length(list_pd)).v;
    list_pd=list_pd(1:length(list_pd)-1); npd=npd-1;
    display(['z list_pd zdjeto proces nr ',num2str(p)]);
    %list_pd

    %przygotowanie argument�w procesu
    for i=1:length(p2s(p).s), args(i)=struct('v',{[]},'e',{[]},'r',{[]},'f',{[]}); end; out=zeros(1,length(p2s(p).o));
    for i=1:length(p2s(p).s), args(i).v=s0(abs(p2s(p).s(i))); args(i).e=0; args(i).r=0; args(i).f=0; end;
    for i=1:length(pi), args(pi(i)).v=vi(i); args(pi(i)).e=1; args(pi(i)).f=1; if(vi(i)==1) args(pi(i)).r=1; args(pi(i)).f=0; end; end;
    %generacja linii wywo�ania procesu
    s=['[']; for i=1:length(p2s(p).o)-1, s=[s,'out(',num2str(i),'),']; end;
    s=[s,'out(',num2str(length(p2s(p).o)),')] = ']; s=[s,p2s(p).typ,'('];
    for i=1:length(p2s(p).s)-1, s=[s,'args(',num2str(i),'),']; end;
    s=[s,'args(',num2str(length(p2s(p).s)),'));'];
    display(['wygenerowano lini�: ',s,' i wykonano proces: ',p2s(p).typ])
    %wykonanie procesu
    eval(s);
        
    %je�li proces wygenerowa� zdarzenie na sygnale wyj�ciowym to wstawienie go na list� ev_list
   
    for no=1:length(out);
       display(['proces ',p2s(p).typ, 'wstawil na ev_list sygnal nr ',num2str(p2s(p).o(no)),' o warto�ci ',num2str(out(no))])
       timenew=time+p2s(p).delay;
       if(timenew<=tend)
          snew=p2s(p).o(no); vnew=out(no); 
          [ev_list,NE]=ev_push(ev_list,NE,timenew,snew,vnew);
       end
    end
end

