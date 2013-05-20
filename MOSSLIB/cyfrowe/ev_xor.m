function s=ev_xor(v1,v2)
s=2;
if (v1.v==0 && v2.v==1||v1.v==1 && v2.v==0)
    s=1;
elseif (v1.v==0.5 || v2.v==0.5)
    s=0.5;
else
    s=0;
end