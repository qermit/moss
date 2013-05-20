function c=cjapp(CJ0,u,V0,M)
x=u/V0;
if(x<=0.9)
    c=CJ0/((1-x)^M);
else
    c=CJ0*(10*x-8)*10^M;
end