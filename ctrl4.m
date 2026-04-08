function [sys,x0,str,ts] = ctrl4(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts]=mdlInitializeSizes
global node c b Fai
node=21;
c= [-10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10;
    -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10;
   ];
b=5;
Fai=5*eye(2);

sizes = simsizes;
sizes.NumContStates  = 47;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 8;
sizes.NumInputs      = 26;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = zeros(1,47);
str = [];
ts  = [];
function sys=mdlDerivatives(t,x,u)
global node c b Fai
qd1=u(1);
d_qd1=u(2);
dd_qd1=u(3);
qd2=u(4);
d_qd2=u(5);
dd_qd2=u(6);

q1=u(7);
d_q1=u(8);
q2=u(9);
d_q2=u(10);
q1t=u(11);
d_q1t=u(12);
q2t=u(13);
d_q2t=u(14);
q41t=u(15);
d_q41t=u(16);
q42t=u(17);
d_q42t=u(18);
qd1t=u(19);
d_qd1t=u(20);
qd2t=u(21);
d_qd2t=u(22);
v11=u(23);
v12=u(24);
b21=u(25);
b22=u(26);

e1=-1*(q41t-sign(-1)*q1);
e2=-1*(q42t-sign(-1)*q2);
%v=[x(46);x(47)];
D=[2 0; 0 3];
hatqd1=x(44);
hatqd2=x(45);
ds1=-d_q1;
ds2=-d_q2;
de1=-1*(d_q41t-sign(-1)*d_q1);
de2=-1*(d_q42t-sign(-1)*d_q2);
e=[e1;e2];
de=[de1;de2];
ds=[ds1;ds2];
r=ds+Fai*e;
hatqd=[hatqd1;hatqd2];
b1=x(46)-x(47);
b2=x(46)-x(47);
hatdv1=-3*(x(44)-d_qd1-v11+d_qd1t+x(44)-d_qd1);
hatdv2=-3*(x(45)-d_qd2-v12+d_qd2t+x(45)-d_qd2);
dqd=[d_qd1;d_qd2];
dqr=Fai*e;
ddqd=[hatdv1;hatdv2];
ddqr=Fai*de;

q=[q1;q2];
dq=[d_q1;d_q2];
z1=[dqr(1);ddqr(1);];
z2=[dqr(2);ddqr(2);];
for j=1:1:node
    h1(j)=exp(-norm(z1-c(:,j))^2/(b*b));
    h2(j)=exp(-norm(z2-c(:,j))^2/(b*b));
end

F=5*eye(node);
for i=1:1:node
    sys(i)=5*h1(i)*r(1);
    sys(i+node)=5*h2(i)*r(2);
end
sys(43)=0.5*norm(r);
sys(44)=hatdv1;
sys(45)=hatdv2;
sys(46)=b1;
sys(47)=b2;
function sys=mdlOutputs(t,x,u)
global node c b Fai

qd1=u(1);
d_qd1=u(2);
dd_qd1=u(3);
qd2=u(4);
d_qd2=u(5);
dd_qd2=u(6);

q1=u(7);
d_q1=u(8);
q2=u(9);
d_q2=u(10);
q1t=u(11);
d_q1t=u(12);
q2t=u(13);
d_q2t=u(14);
q41t=u(15);
d_q41t=u(16);
q42t=u(17);
d_q42t=u(18);
qd1t=u(19);
d_qd1t=u(20);
qd2t=u(21);
d_qd2t=u(22);
v11=u(23);
v12=u(24);
b21=u(25);
b22=u(26);

e1=-1*(q41t-sign(-1)*q1);
e2=-1*(q42t-sign(-1)*q2);
%v=[x(46);x(47)];
D=[2 0; 0 3];
hatqd1=x(44);
hatqd2=x(45);
ds1=-d_q1;
ds2=-d_q2;
de1=-1*(d_q41t-sign(-1)*d_q1);
de2=-1*(d_q42t-sign(-1)*d_q2);
e=[e1;e2];
de=[de1;de2];
ds=[ds1;ds2];
r=ds+Fai*e;
hatqd=[hatqd1;hatqd2];
b1=x(46)-x(47);
b2=x(46)-x(47);
hatdv1=-3*(x(44)-d_qd1t-v11+d_qd1t+x(44)-d_qd1t);
hatdv2=-3*(x(45)-d_qd2t-v12+d_qd2t+x(45)-d_qd2t);
dqd=[d_qd1;d_qd2];
dqr=Fai*e;
ddqd=[hatdv1;hatdv2];
ddqr=Fai*de;



W_f1=[x(1:node)]';
W_f2=[x(node+1:node*2)]';
q=[q1;q2];
dq=[d_q1;d_q2];
z1=[dqr(1);ddqr(1);];
z2=[dqr(2);ddqr(2);];
for j=1:1:node
    h1(j)=exp(-norm(z1-c(:,j))^2/(b*b));
    h2(j)=exp(-norm(z2-c(:,j))^2/(b*b));
end

fn=[W_f1*h1';
    W_f2*h2'];

K1=[30 0;0 30];

%ke=[0.5*exp(-2*t);0.5*exp(-2*t)];
v=x(2*node+1)*sign(r); 
tol=fn+v+K1*r;
sys(1)=tol(1);
sys(2)=tol(2);
sys(3)=x(44);
sys(4)=x(45);
sys(5)=x(46);
sys(6)=x(47);
sys(7)=norm(W_f1);
sys(8)=norm(W_f2);