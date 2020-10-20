% Question 3 Part A and B
[H_4, err_4,decade_below_4, decade_above_4, octave_below_4, octave_above_4] = mag(4);
[H_10, err_10,decade_below_10, decade_above_10, octave_below_10, octave_above_10] = mag(10);

% Note that the difference between the value at w=1 is approximately
% 20*log(Q)
diff4 = err_4 - 20*log10(4);
diff10 = err_10 - 20*log10(10);

% Question 3 Part C
% for Q = 4
a = [1,1/4,1];
b = [1];
[h_4, w] = freqs(b,a,1000);
% for Q = 10
a = [1,1/10,1];
b = [1];
[h_10, w] = freqs(b,a,1000);

% plot the phase responses
figure;
semilogx(w,angle(h_4)*180/pi);
hold on
semilogx(w,angle(h_10)*180/pi);
hold off
grid on
title('Phase Response for Q = 4 and Q = 10');
legend('Q = 4', 'Q = 10');