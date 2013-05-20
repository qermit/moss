function [ev_list,NE,s0,list_pd]=ev_delta(ev_list,NE,time,s0,s2p,p2s,it,ncmax)
%cykl delta dla chwili bie��cej (pod indeksem it)

ns=0; np=0; npd=0; nc=0; list_s=struct('s',{},'v',{}); list_p=struct('p',{},'pi',{},'v',{}); list_pd=struct('p',{},'pi',{},'v',{}); 
%wstawienie wymusze� w chwili time na list_s: w chwili zero wszystkich, w chwili >0 tylko tych kt�re generuj� zdarzenia
for i=1:length(ev_list(it).s)
   if(time==0 || (ev_list(it).v(i)~=s0(ev_list(it).s(i))))
       as.s=ev_list(it).s(i); as.v=ev_list(it).v(i); 
       list_s=[list_s,as]; ns=ns+1;
       display(['na list_s wstawiono sygnal wymuszony nr ',num2str(ev_list(it).s(i)),' o warto�ci ',num2str(ev_list(it).v(i))])
   end
end
%display('list_s po wstaw inicjalizacji')
%list_s

%g��wna p�tla po sygna�ach i procesach a� do opr�nienia list sygna��w i proces�w
while((ns~=0 || np~=0) && nc<=ncmax)
    
while(ns>0)
    %zdj�cie sygna�u z listy sygna��w i zapisanie w wektorze biez�cej odpowiedzi s0
    s=list_s(length(list_s)).s; v=list_s(length(list_s)).v; list_s=list_s(1:length(list_s)-1); ns=ns-1; s0(s)=v;
    display(['z list_s zdjeto sygna� nr ',num2str(s),' o warto�ci ',num2str(v)])

    %wstawienie zaleznych proces�w i ich wej�� aktywnych na list� proces�w
    for j=1:length(s2p(s).pr)
        for jj=1:length(p2s(s2p(s).pr(j)).s)
            if(p2s(s2p(s).pr(j)).s(jj)==s)
                if(p2s(s2p(s).pr(j)).delay==0)
                    [list_p,np]=ev_addproc(list_p,s2p(s).pr(j),jj,v,np); %list_p
                    display(['na list_p wstawiono proces ',num2str(s2p(s).pr(j)),' jego wej�cie ',num2str(jj),' i wartosc ',num2str(v)])
                else
                    [list_pd,npd]=ev_addproc(list_pd,s2p(s).pr(j),jj,v,npd); %list_pd
                    display(['na list_pd wstawiono proces opozniony',num2str(s2p(s).pr(j)),' jego wej�cie ',num2str(jj),' i wartosc ',num2str(v)])
                end
            end
        end
    end
end

while(np>0)
    %zdj�cie procesu z listy proces�w list_p i jego wej�cia z listy wej�� list_pi
    p=list_p(length(list_p)).p; pi=list_p(length(list_p)).pi; vi=list_p(length(list_p)).v;
    list_p=list_p(1:length(list_p)-1); np=np-1;
    display(['z list_p zdjeto proces nr ',num2str(p)]);
    %list_p

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
        
    %je�li proces wygenerowa� zdarzenie na sygnale wyjsciowym to wstawienie go na list� list_s
    for no=1:length(out);
        if(out(no)~=s0(p2s(p).o(no)) && out(no)~=2) %2 oznacza �e proces nie zmieni� wyj�cia
             display(['proces ',p2s(p).typ, 'wstawil na list_s sygnal nr ',num2str(p2s(p).o(no)),' o warto�ci ',num2str(out(no))])
             as.s=p2s(p).o(no); as.v=out(no); list_s=[list_s,as]; ns=ns+1;             
        end
    end
end
nc=nc+1; if(nc>ncmax), display(['przekroczono maksymaln� liczb� cykli ',num2str(ncmax)]); end;
end
