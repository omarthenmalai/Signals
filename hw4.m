A=[1,2,10;12,1,14;1,0,1];
A = gramSchmidt(A);
output = isOrthonormal(A);

% test
A = rand(100,10);
B = rand(100,10);
A = gramSchmidt(A);
output = isOrthonormal(A);
%B = orthoProj(B, A);

% Sampling
x = 0:0.01:2*pi;
y = sin(x);
g = normrnd(0, 1);