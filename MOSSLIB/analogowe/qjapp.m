function q=qjapp(CJ0,u,V0,M)
x=u/V0;
if(x<=0.9)
    q=CJ0*V0*(1-(1-x)^(1-M))/(1-M);
else
    q=CJ0*V0*(1-10^(M-1))/(1-M);
    q=q+CJ0*V0*(5*x-3.5)*(x-0.9)*10^M;
end