% Problem Set #9
% Question 2
b = [1, 1, 0.36];
a = [1, -0.6, 0.9];
[z,poles,k] = tf2zp(b,a);
figure
zplane(z,poles);
% Question 3
n = 10000;
v = 2.*randn(n,1);
x = filter(b,a,v);
% Question 4
r = zeros(1,6);
x_transposed = transpose(x);
for m = 0:5
    r(m+1) = ((x_transposed(m+1:n)*x(1:n-m))/(n-m));
end
% Question 5
R = toeplitz(r);
% Question 6
eig_R = eig(R);  % Note that all of the eigenvalues are positive!
% Question 7
[s_est,w] = pwelch(x,hamming(512),256,512);
% Question 8
[H,w_2] = freqz(b,a,257);
s_actual = 4.*(abs(H).^2);
s_est_normalized = s_est/mean(s_est);
s_act_normalized = s_actual/mean(s_actual);
figure
plot(w, s_est_normalized)
xlim([0 pi])
hold on
plot(w_2, s_act_normalized)
xbounds=[0,pi];
xlim(xbounds);
legend("Estimated","Actual");
title("Estimated PSD and Actual PSD (Normalized)");
xlabel("w (radians per second)");
ylabel("Normalized Power Spectral Density");
hold off
% Question 9
angle_p = angle(poles); % The angle of the pole is approximately 1.249
[M,i] = max(s_actual); % S has a peak when w is approxately 1.247
angle_s = w_2(i);
% Question 10
flipped = flip(x(1:6));
r = x(6:end);
A = toeplitz(flipped,r);
singular_A = svd(A);
value_1 = sort(singular_A.^2 / (10000-5));
value_2 = sort(eig_R);
compare = value_1 - value_2; % Note that the eigenvalues are very close to one another
[U,S,V] = svd(A);
B = (R*U)./U; % All of the entries are approximately equal to one of the eigenvalues of R







