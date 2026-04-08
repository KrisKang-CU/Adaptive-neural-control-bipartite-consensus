function [sys,x0,str,ts]=plant2(t,x,u,flag)

switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
global g
sizes = simsizes;
sizes.NumContStates  = 4;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 5;
sizes.NumInputs      =2;
sizes.DirFeedthrough = 4;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[-1.5 -0.2 1.1 0.1];
str=[];
ts=[];

g=9.8;
function sys=mdlDerivatives(t,x,u)    %From Ge book program
m1=1;m2=2;l1=0.5;l2=0.6;l3=1;d1=0.12;d2=0.25;
p1=d1+m1*l1^2+d2+m2*l2^2+m2*l3^2;
p2=d2+m2*l2^2;
p3=m2*l3*l2*cosd(30);
p4=m2*l3*l2*sind(30);
h=p3*sin(x(3))-p4*cos(x(3));
M=[p1+2*p3*cos(x(3))+2*p4*sin(x(3)) p2+p3*cos(x(3))+p4*sin(x(3));
    p2+p3*cos(x(3))+p4*sin(x(3)) p2];
V=[-h*x(4) -h*(x(2)+x(4));
     h*x(2)  0];
dq=[x(2);x(4)];
told=[0.5*sin(t);0.5*sin(t)];

tol=u(1:2);

S=M\(tol-V*dq+told);

sys(1)=x(2);
sys(2)=S(1);
sys(3)=x(4);
sys(4)=S(2);
function sys=mdlOutputs(t,x,~)

told=[0.5*sin(t);0.5*sin(t)];
sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);
sys(4)=x(4);
sys(5)=told(2);