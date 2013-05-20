function ev_plot(nouts,tt,wyj,tbeg,tend)
if(tt(1)>tbeg), tt=[tbeg,tt]; wyj=[wyj(1),wyj]; end;
if(tt(length(tt))<tend), tt=[tt,tend]; wyj=[wyj,wyj(length(wyj))]; end;
for k=1:length(wyj(1).v)
    i=1;
    x(i)=tt(1);
    y(i)=wyj(1).v(k);
    i=i+1;
    for j=2:length(wyj)
         x(i)=tt(j);
         y(i)=y(i-1);
         i=i+1;
         x(i)=tt(j);
         y(i)=wyj(j).v(k);
         i=i+1;
    end
    subplot(length(wyj(1).v),1,k)
    plot(x,y,'r-')
    title(['response for signal v(',num2str(nouts(k)),')'])
    xlabel('time')
    ylabel('value')
end
