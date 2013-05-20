function [out1,out2]=moj1(v1,v2,v3)
out1=2; out2=2;
if (v1.v==0 && v2.v==0 && v3.v==0)
    out1=0; out2=0;
elseif (v1.v==0 && v2.v==0 && v3.v==1)
    out1=1; out2=0;
elseif (v1.v==0 && v2.v==1 && v3.v==0)
    out1=1; out2=1;
elseif (v1.v==0 && v2.v==1 && v3.v==1)
    out1=1; out2=0;
elseif (v1.v==1 && v2.v==0 && v3.v==0)
    out1=1; out2=0;
elseif (v1.v==1 && v2.v==0 && v3.v==1)
    out1=1; out2=0;
elseif (v1.v==1 && v2.v==1 && v3.v==0)
    out1=1; out2=0;
else
    %1 1 1
    out1=1; out2=1;
end