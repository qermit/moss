function [list_p,np]=ev_addproc(list_p,p,in,v,np);
for i=1:length(list_p)
    if(list_p(i).p==p)
        for j=1:length(list_p(i).pi)
            if(list_p(i).pi(j)==in)
                if(list_p(i).v~=v)
                    list_p(i).v=v;
                    display('redefinicja wartoœci na istniej¹cym wejœciu procesu - nadpisano');
                end
                return;
            else
                %nowe wejœcie istniej¹cego procesu
                list_p(i).pi=[list_p(i).pi,in]; list_p(i).v=[list_p(i).v,v]; return;
            end
        end
    end
end
addp.p=p; addp.pi=in; addp.v=v;
list_p=[list_p,addp]; np=np+1;