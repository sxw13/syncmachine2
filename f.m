function u = f(x,y,udata)
%微分方程部分

    delta=x(1);omega=x(2);
    Eqp=x(3);Eqpp=x(4);Edp=x(5);Edpp=x(6);
    Pm=x(7);Efq=x(8);
    Ud=y(1);Uq=y(2);Id=y(3);Iq=y(4);
    U=y(5);P=y(6);Q=y(7);
    gen=udata.gen;
    Xd = gen(1);Xdp = gen(2);Xdpp = gen(3);
    Xq = gen(4);Xqp = gen(5);Xqpp = gen(6);
    Td0p = gen(7);Td0pp = gen(8);Tq0p = gen(9);
    Tq0pp = gen(10);Tj = gen(11);
    P0= gen(12);Q0=gen(13);U0=gen(14);
    %微分方程
    D = 0;
    omega0=100*pi;
    d_delta = omega * omega0;
    d_omega = ((Pm-(Id.*Ud+Iq.*Uq))./(1+omega)-D.*omega)./Tj;
    d_Eqp = (-(Xd-Xdpp)./(Xdp-Xdpp).*Eqp+(Xd-Xdp)./(Xdp-Xdpp).*Eqpp+Efq)./Td0p;
    d_Eqpp = (Eqp-Eqpp-(Xdp-Xdpp).*Id)./Td0pp;
    d_Edp = (-(Xq-Xqpp)./(Xqp-Xqpp).*Edp+(Xq-Xqp)./(Xqp-Xqpp).*Edpp)./Tq0p;
    d_Edpp = (Edp-Edpp+(Xqp-Xqpp).*Iq)./Tq0pp;
    d_Pm = 0;
    d_Efq = 0;
    u=[d_delta;d_omega;d_Eqp;d_Eqpp;d_Edp;d_Edpp;d_Pm;d_Efq];
end