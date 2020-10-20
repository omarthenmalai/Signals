% Question 1
N = [ 1/2, 2/3, 3/7];
D = [ 2, 1/3, 1/2];
figure;
subplot(4,1,1);
zplane(N, D);

sys = tf(N,D);
P = pole(sys);
Z = zero(sys);

[response, sample_time] = impz(N,D, 50);

subplot(4,1,2);
plot(sample_time, response);

n = linspace(0,99);
x = (-3/4).^(n);
y = filter(N,D,x);
subplot(4,1,3);
plot(n, y);

x_filtered = conv(x(1:50), response);
subplot(4,1,4);
plot(n(1:99), x_filtered);

% Question 2
first = 1;
second = 1;
F = [first, second];
for i = 3:100
    sum = first + second;
    first = second;
    second = sum;
    F = [F, sum];
end
figure;
subplot(2,1,1);
semilogy(F);


output = conv(x, F);
t = 1:1:199;
subplot(2,1,2);
plot(t,output);
