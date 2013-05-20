function [umod,iD]=modyf(uD,iD,UT,Is,ukr)
if(uD<ukr)
    umod=uD;
else
    umod=UT*log((iD/Is)+1);
end