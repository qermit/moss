function s=ev_and(v1,v2)
s=2;
if (v1.v==1 && v2.v==1)
    s=1;
elseif (v1.v==0 || v2.v==0)
    s=0;
else
    s=0.5;
end