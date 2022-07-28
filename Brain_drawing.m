clc;
close all;
clear all;

load exp1_64x64;
plot(history.ta,'LineWidth',2); grid;
xlabel('{\bf Iteration}','interpreter','latex','FontName','Times','fontsize',10)
ylabel('{\bf Accuracy}','interpreter','latex','FontName','Times','fontsize',10)
% axis([0  length(history.ta)  min(history.ta) 10]);
hold on;

load exp2_64x64;
plot(history.ta,'r-.','LineWidth',2); grid;
xlabel('{\bf Iteration}','interpreter','latex','FontName','Times','fontsize',10)
ylabel('{\bf Accuracy}','interpreter','latex','FontName','Times','fontsize',10)
% axis([0  length(history.ta)  min(history.ta) 10]);

load exp3_64x64;
plot(history.ta,'b-','LineWidth',2); grid;
xlabel('{\bf Iteration}','interpreter','latex','FontName','Times','fontsize',10)
ylabel('{\bf Accuracy}','interpreter','latex','FontName','Times','fontsize',10)
% axis([0  length(history.ta)  min(history.ta) 10]);

load exp4_64x64;
plot(history.ta,'k-.','LineWidth',2); grid;
xlabel('{\bf Iteration}','interpreter','latex','FontName','Times','fontsize',10)
ylabel('{\bf Accuracy}','interpreter','latex','FontName','Times','fontsize',10)
% axis([0  length(history.ta)  min(history.ta) 10]);

%legend('100 Images','200 Images','300 Images','350 Images'); grid;

%============================================================
figure;
load exp1_128x128;
plot(history.tl,'LineWidth',2); grid;
xlabel('{\bf Iteration}','interpreter','latex','FontName','Times','fontsize',10)
ylabel('{\bf Loss}','interpreter','latex','FontName','Times','fontsize',10)
% axis([0  length(history.ta)  min(history.ta) 10]);
hold on;

load exp2_128x128;
plot(history.tl,'r-.','LineWidth',2); grid;
xlabel('{\bf Iteration}','interpreter','latex','FontName','Times','fontsize',10)
ylabel('{\bf Loss}','interpreter','latex','FontName','Times','fontsize',10)
% axis([0  length(history.ta)  min(history.ta) 10]);

load exp3_128x128;
plot(history.tl,'b-','LineWidth',2); grid;
xlabel('{\bf Iteration}','interpreter','latex','FontName','Times','fontsize',10)
ylabel('{\bf Loss}','interpreter','latex','FontName','Times','fontsize',10)
% axis([0  length(history.ta)  min(history.ta) 10]);

load exp3_128x128;
plot(history.tl,'k-.','LineWidth',2); grid;
xlabel('{\bf Iteration}','interpreter','latex','FontName','Times','fontsize',10)
ylabel('{\bf Loss}','interpreter','latex','FontName','Times','fontsize',10)
% axis([0  length(history.ta)  min(history.ta) 10]);

%legend('100 Images','200 Images','300 Images','350 Images'); grid;

