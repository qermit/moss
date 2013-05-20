function [Y,B]=stamp_i(Y,B,varargin)
%format
%[Y,B]=stamp_i(Y,B,ma,na,{'gaa',gaa},{'gab',gab,mb,nb},{'kac',kac,ic},{'jaa',jaa})
n=nargin-2; i=1; if(i>n) display('bledny szablon i'); return; end;
ma=varargin{i}; i=i+1; if(i>n) display('bledny szablon i'); return; end;
na=varargin{i}; i=i+1; if(i>n) display('bledny szablon i'); return; end;
while(i<=n)
s=varargin{i}; i=i+1; if(i>n) display('bledny szablon i'); return; end;
if(s=='gaa')
    gaa=varargin{i}; i=i+1;
    if(ma~=0)
        Y(ma,ma)=Y(ma,ma)+gaa;
        if(na~=0)Y(ma,na)=Y(ma,na)-gaa; Y(na,ma)=Y(na,ma)-gaa; end
    end    
    if(na~=0) Y(na,na)=Y(na,na)+gaa; end   
elseif(s=='gab')
    gab=varargin{i}; i=i+1; if(i>n) display('bledny szablon i'); return; end;
    mb=varargin{i};  i=i+1; if(i>n) display('bledny szablon i'); return; end; 
    nb=varargin{i};  i=i+1;
    if(ma~=0)
        if(mb~=0)Y(ma,mb)=Y(ma,mb)+gab; end
        if(nb~=0)Y(ma,nb)=Y(ma,nb)-gab; end
    end
    if(na~=0)
        if(mb~=0)Y(na,mb)=Y(na,mb)-gab; end
        if(nb~=0)Y(na,nb)=Y(na,nb)+gab; end
    end
elseif(s=='kac')
    kac=varargin{i}; i=i+1; if(i>n) display('bledny szablon i'); return; end;
    ic=varargin{i};  i=i+1;
    if(ma~=0) Y(ma,ic)=Y(ma,ic)+kac; end
    if(na~=0) Y(na,ic)=Y(na,ic)-kac; end
elseif(s=='jaa')
    jaa=varargin{i};    i=i+1;
    if(ma~=0) B(ma)=B(ma)-jaa; end
    if(na~=0) B(na)=B(na)+jaa; end
else
    display('bledny szablon i')
end
end 