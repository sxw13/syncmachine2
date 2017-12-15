function v = g(x,y,udata)
%代数方程部分
    v=y;
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
    % 发电机方程
    v(1)=Ud.^2+Uq.^2-U.^2;
    v(2)=P-(Id.*Ud+Iq.*Uq);
    v(3)=Q-(Uq.*Id-Ud.*Iq);
    v(4)=Eqpp-Uq-Id.*Xdpp;
    v(5)=Edpp-Ud+Iq.*Xqpp;
    % 负荷方程
    load=udata.load;
    load_P0=load(1);load_Q0=load(2);load_U0=load(3);
    v(6)=P-(U./load_U0).^2.*load_P0;
    v(7)=Q-(U./load_U0).^2.*load_Q0;
end