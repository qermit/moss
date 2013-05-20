function [Y,B]=stamp_u(Y,B,varargin)
%format
%[Y,B]=stamp_u(Y,B,ma,na,ia,{'raa',raa},{'tab',tab,mb,nb},{'rac',rac,ic},{'eaa',eaa})
n=nargin-2; i=1; if(i>n) display('bledny szablon u'); return; end;
ma=varargin{i}; i=i+1; if(i>n) display('bledny szablon u'); return; end;
na=varargin{i}; i=i+1; if(i>n) display('bledny szablon u'); return; end;
ia=varargin{i}; i=i+1; if(i>n) display('bledny szablon u'); return; end;
if(ma~=0) Y(ma,ia)=Y(ma,ia)+1; Y(ia,ma)=Y(ia,ma)-1;end    
if(na~=0) Y(na,ia)=Y(na,ia)-1; Y(ia,na)=Y(ia,na)+1;end
while(i<=n)
s=varargin{i}; i=i+1; if(i>n) display('bledny szablon u'); return; end;
if(s=='raa')
    raa=varargin{i}; i=i+1;
    Y(ia,ia)=Y(ia,ia)+raa;    
elseif(s=='tab')
    tab=varargin{i}; i=i+1; if(i>n) display('bledny szablon u'); return; end;
    mb=varargin{i};  i=i+1; if(i>n) display('bledny szablon u'); return; end; 
    nb=varargin{i};  i=i+1;
    if(mb~=0)Y(ia,mb)=Y(ia,mb)+tab; end
    if(nb~=0)Y(ia,nb)=Y(ia,nb)-tab; end
elseif(s=='rac')
    rac=varargin{i}; i=i+1; if(i>n) display('bledny szablon u'); return; end;
    ic=varargin{i};  i=i+1;
    Y(ia,ic)=Y(ia,ic)+rac;
elseif(s=='eaa')
    eaa=varargin{i};    i=i+1;
    B(ia)=B(ia)-eaa;
else
    display('bledny szablon u')
end
end 