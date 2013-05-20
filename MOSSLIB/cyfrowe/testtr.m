clear all

print=0;

for ncir=1:8;

[s2p,p2s,wymuszenia,nouts,NS,tbeg,tend]=ev_uklady(ncir,print);

display(['ANALIZA UKLADU NR: ',num2str(ncir),' od chwili ',num2str(tbeg),' do ',num2str(tend)]);

ncmax=10; vstart=0;
s0=vstart*ones(1,NS);

[tt,wyj,s0]=ev_tran(s0,s2p,p2s,wymuszenia,nouts,tend,ncmax);

figure(ncir);
ev_plot(nouts,tt,wyj,tbeg,tend);

end