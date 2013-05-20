function y=dxpo(x)
xg=40;
if x<=0
    y=1/(1-x)/(1-x);
elseif x<=xg
    y=exp(x);
else
    y=exp(xg);
end
