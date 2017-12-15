function Ini0 = initialSys
%≥ı ºªØº‹ππ
in0 = ones(15,1);
udata = rundata;
[Ini0,fval,exitflag] = fsolve(@(in)myfunc(in,udata),in0)

function out = myfunc(in0,udata)
    
    load=udata.load;
    P0=load(1);Q0=load(2);U0=load(3);
    out = in0;
    x=in0(1:8);y=in0(9:15);
    delta=x(1);omega=x(2);
    Ud=y(1);Uq=y(2);
    U=y(5);P=y(6);Q=y(7);
    out(1:8)=f(x,y,udata);
    out(9:15)=g(x,y,udata);
    out(end+1)=tan(delta)-Ud./Uq;
    out(end+1)=P-P0;
    out(end+1)=U-U0;
    out(end+1)=Q-Q0;
end
end