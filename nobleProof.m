function [y1,y2,check] = nobleProof(h,g,x,M)
h = ups(g,M);
v = conv(h,x);
h = dec(h,M);
h(:) = g(:);
y1 = dec(v,M);

u = dec(x,M);
y2 = conv(g,u);

check = isequal(y1,y2);
end