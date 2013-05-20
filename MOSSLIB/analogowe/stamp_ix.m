function [Y,B]=stamp_ix(Y,B,varargin)
%format
%[Y,B]=stamp_ix(Y,B,ma,na,ia,{'gaa',gaa},{'gab',gab,mb,nb},{'kac',kac,ic},{'jaa',jaa})
n=nargin-2; i=1; if(i>n) display('bledny szablon ix'); return; end;
ma=varargin{i}; i=i+1; if(i>n) display('bledny szablon ix'); return; end;
na=varargin{i}; i=i+1; if(i>n) display('bledny szablon ix'); return; end;
ia=varargin{i}; i=i+1; if(i>n) display('bledny szablon ix'); return; end;
if(ma~=0) Y(ma,ia)=Y(ma,ia)+1; end    
if(na~=0) Y(na,ia)=Y(na,ia)-1; end
Y(ia,ia)=Y(ia,ia)-1;
while(i<=n)
s=varargin{i}; i=i+1; if(i>n) display('bledny szablon ix'); return; end;
if(s=='gaa')
    gaa=varargin{i}; i=i+1;
    if(ma~=0) Y(ia,ma)=Y(ia,ma)+gaa; end    
    if(na~=0) Y(ia,na)=Y(ia,na)-gaa; end   
elseif(s=='gab')
    gab=varargin{i}; i=i+1; if(i>n) display('bledny szablon ix'); return; end;
    mb=varargin{i};  i=i+1; if(i>n) display('bledny szablon ix'); return; end; 
    nb=varargin{i};  i=i+1;
    if(mb~=0)Y(ia,mb)=Y(ia,mb)+gab; end
    if(nb~=0)Y(ia,nb)=Y(ia,nb)-gab; end
elseif(s=='kac')
    kac=varargin{i}; i=i+1; if(i>n) display('bledny szablon ix'); return; end;
    ic=varargin{i};  i=i+1;
    Y(ia,ic)=Y(ia,ic)+kac;
elseif(s=='jaa')
    jaa=varargin{i};    i=i+1;
    B(ia)=B(ia)-jaa;
else
    display('bledny szablon ix')
end
end 