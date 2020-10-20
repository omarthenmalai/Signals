function signalPlot(x,init)
nx = init:1:(length(x)+init-1);
stem(nx,x,'color',[1,0,0]);
end