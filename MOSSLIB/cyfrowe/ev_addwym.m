function wym=ev_addwym(wym,tbeg,tend,time,varargin)
if(time<tbeg || time>tend) return; end;
n=nargin-4; n2=floor(n/2); if(n-2*n2==1), display('bledne okreœlenie wymuszenia'); end; iarg=1;
for k=1:n2
    fl=0;
    for i=1:length(wym)
        if(wym(i).time==time)
            wym(i).s=[wym(i).s, varargin{iarg}]; wym(i).v=[wym(i).v,varargin{iarg+1}]; iarg=iarg+2; fl=1;
        elseif(wym(i).time>time)
            addwym.s=varargin{iarg}; addwym.v=varargin{iarg+1}; addwym.time=time; iarg=iarg+2;
            wym=[wym(1:i-1),addwym,wym(i:length(wym))]; fl=1;
        end
    end
    if(fl==0)
        addwym.s=varargin{iarg}; addwym.v=varargin{iarg+1}; addwym.time=time; iarg=iarg+2; wym=[wym,addwym];
    end
end