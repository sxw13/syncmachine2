function main
%完成初始化
%包含求解DAE方程组的基本架构
x0 = initialSys;
M = diag([ones(1,8) zeros(1,7)]);
udata = rundata;
udata.load(1)=0.5;
options = odeset('Mass',M,'RelTol',1e-6);
[t,y] = ode15s(@udf,0:0.01:4,x0,options)
plot(t,y);grid on;

    function out=udf(t,in)
    out=in;
    x=in(1:8);yy=in(9:15);
    u = f(x,yy,udata);
    v = g(x,yy,udata);
    out=[u;v];
    end
end