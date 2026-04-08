close all;

figure(1);
subplot(211);
plot(t,x(:,3),'-',t,x(:,4),'-',t,x(:,5),'-',t,x(:,6),'--',t,x(:,7),'--',t,x(:,8),'--','linewidth',2);
xlabel('time(s)');ylabel('$q_{i1},i=1,2,...,6$');
legend('R1 ','R2 ','R3 ','R4 ','R5 ','R6 ');
%ylim([-4,4])
grid on
subplot(212);
plot(t,x(:,9),'-',t,x(:,10),'-',t,x(:,11),'-',t,x(:,12),'--',t,x(:,13),'--',t,x(:,14),'--','linewidth',2);
xlabel('time(s)');ylabel('$q_{i2},i=1,2,...,6$');
legend('R1 ','R2 ','R3 ','R4 ','R5 ','R6 ');
%ylim([-5,5])
grid on

figure(2);
subplot(211);
plot(t,dx(:,3),'-',t,dx(:,4),'-',t,dx(:,5),'-',t,dx(:,6),'--',t,dx(:,7),'--',t,dx(:,8),'--','linewidth',2);
xlabel('time(s)');ylabel('$\dot{q}_{i1},i=1,2,...,6$');
legend('R1 ','R2 ','R3 ','R4 ','R5 ','R6 ');
%ylim([-4,4])
grid on
subplot(212);
plot(t,dx(:,9),'-',t,dx(:,10),'-',t,dx(:,11),'-',t,dx(:,12),'--',t,dx(:,13),'--',t,dx(:,14),'--','linewidth',2);
xlabel('time(s)');ylabel('$\dot{q}_{i2},i=1,2,...,6$');
legend('R1 ','R2 ','R3 ','R4 ','R5 ','R6 ');
%ylim([-5,5])
grid on

figure(6);
subplot(211);
plot(t,Wf(:,1),'-',t,Wf(:,3),'-',t,Wf(:,5),'--',t,Wf(:,7),'--',t,Wf(:,9),'--',t,Wf(:,11),'--','linewidth',2);
xlabel('time(s)');ylabel('$\|\hat{D}_{i1}^{(1)}\|,i=1,2,...,6$');
%legend('$\|\hat{D}_{11}^{(2)}\|$ ','$\|\hat{D}_{21}^{(2)}\|$  ','$\|\hat{D}_{31}^{(2)}\|$  ','$\|\hat{D}_{41}^{(2)}\|$  ','$\|\hat{D}_{51}^{(2)}\|$  ','$\|\hat{D}_{61}^{(2)}\|$  ');
legend('R1 ','R2 ','R3 ','R4 ','R5 ','R6 ');
%ylim([-1,6])
grid on
subplot(212);
plot(t,Wf(:,2),'-',t,Wf(:,4),'-',t,Wf(:,6),'--',t,Wf(:,8),'--',t,Wf(:,10),'--',t,Wf(:,12),'--','linewidth',2);
xlabel('time(s)');ylabel('$\|\hat{D}_{i2}^{(1)}\|,i=1,2,...,6$');
%legend('$\|\hat{D}_{12}^{(2)}\|$ ','$\|\hat{D}_{22}^{(2)}\|$  ','$\|\hat{D}_{32}^{(2)}\|$  ','$\|\hat{D}_{42}^{(2)}\|$  ','$\|\hat{D}_{52}^{(2)}\|$  ','$\|\hat{D}_{62}^{(2)}\|$  ');
legend('R1 ','R2 ','R3 ','R4 ','R5 ','R6 ');
%ylim([-1,6])
grid on
