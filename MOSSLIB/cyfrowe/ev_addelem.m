function [s2p,p2s]=ev_addelem(s2p,p2s,np,delay,varargin)
%s2p,p2s,np,delay,nout1,...,noutn,typ,nin1,...,ninm
n=nargin-4; ik=0; if(np<=0), display('blad 1 funkcji addelem'), return, end; if(delay<0), display('blad 2 funkcji addelem'), return, end;
for i=1:n, if(ischar(varargin{i})), ik=i; end, end;
if(ik==0), display('blad 3 funkcji addelem'), return
else
    typ=varargin{ik};
    nouts=zeros(1,ik-1);
    for i=1:ik-1
        nouts(i)=varargin{i};
    end
    nins=zeros(1,n-ik);
    for i=1:n-ik
        nins(i)=varargin{ik+i};
    end;
end
if(strcmp(typ,'nand') && length(nins)~= 2 && length(nouts)~=1), display('blad 4 funkcji addelem'), return, end;
if(strcmp(typ,'and ') && length(nins)~= 2 && length(nouts)~=1), display('blad 5 funkcji addelem'), return, end;
if(strcmp(typ,'or  ') && length(nins)~= 2 && length(nouts)~=1), display('blad 6 funkcji addelem'), return, end;
if(strcmp(typ,'xor ') && length(nins)~= 2 && length(nouts)~=1), display('blad 7 funkcji addelem'), return, end;
if(strcmp(typ,'not ') && length(nins)~= 1 && length(nouts)~=1), display('blad 8 funkcji addelem'), return, end;
for i=1:length(nins)
    if(nins(i)>=0), s2p(nins(i)).pr=[s2p(nins(i)).pr,np]; end
end
p2s(np).s=nins;
p2s(np).o=nouts;
p2s(np).typ=typ;
p2s(np).delay=delay;