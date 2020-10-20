clear all;
% Q2 parts b and c
H = [2 3 4 2 5];
X = [3 4 5 1 2];
inith = -1;
initx = -2;
Y = conv(H,X);
inity = inith+initx;

figure
subplot(3,1,1)
signalPlot(H,inith)
title('h[n]')

subplot(3,1,2)
signalPlot(X,initx)
title('x[n]')

subplot(3,1,3)
signalPlot(Y,inity)
title('y[n]')



%Question 3

% part b
g = [2 1 3 4];
h = ups(g,4);
x = randi([-2 2],1,10);
%%%%%%%%%%%
figure
subplot(3,1,1)
signalPlot(g,0)
title('g[n]')
%%%%%%%%%%%
subplot(3,1,2)
signalPlot(h,0)
title('h[n]')
%%%%%%%%%%%
subplot(3,1,3)
signalPlot(x,0)
title('x[n]')

% part c
updownx = dec((ups(x,4)),4);
downupx = ups((dec(x,4)),4);
%%%%%%%%%%%%%%
figure
subplot(2,1,1)
signalPlot(updownx,0)
title('(down4)(up4)x')
%%%%%%%%%%%%%
subplot(2,1,2)
signalPlot(downupx,0)
title('(up4)(down4)x')

% part d
d1 = dec(conv(h,x),4);
d2 = conv(g,dec(x,4));
d = isequal(d1,d2);
%%%%%%%%%%%%%%
figure
subplot(2,1,1)
signalPlot(d1,0)
title('d1[n]')
%%%%%%%%%%%%%%%
subplot(2,1,2)
signalPlot(d2,0)
title('d1[n]')

% part e
u1 = conv(h,ups(x,4));
u2 = ups(conv(g,x),4);
u = isequal(u1,u2);
%%%%%%%%%%%
figure
subplot(2,1,1)
signalPlot(u1,0)
title('u1[n]')
%%%%%%%%%%5%%
subplot(2,1,2)
signalPlot(u2,0)
title('d2[n]')

% part f
[y1,y2,check] = nobleProof(h,g,x,4);