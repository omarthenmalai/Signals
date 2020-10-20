% Question #2

% PART A

% numerator
a1 = 2;
a2 = [1,-3];
a3 = [3,-2];
a4 = [2,-1];
a = a1*conv(a2,conv(a3,conv(a3,a4)));

% denominator
b1 = [4,-3];
b2 = [2,1];
b = conv(b1, conv(b1, conv(b2,b2)));

H = tf(a,b);
[z,p,k] = tf2zp(a,b);

% PART B
%figure;
%zplane(a,b);

% PART C
n = 0:19;
x = (0.8).^n.*cos(4*pi*n/5);
y = filter(a,b,x);
figure;
subplot(2,1,1);
stem(n,x);
subplot(2,1,2);
stem(n,y);

fs = 10000;
[h,f] = freqz(a,b,1000,fs);
db = mag2db(abs(h));

figure;
% Magnitude Response
subplot(2,1,1)
plot(f, db)
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
% Phase Response
subplot(2,1,2);
plot(f, unwrap(angle(h))*180/pi);
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');

% Question 3

% Cheby1
[zc,pc,kc] = cheby1(4,3,50000*2*pi,'s');
[bc,ac] = zp2tf(zc,pc,kc);
figure;
subplot(2,1,1);
splane(bc,ac);
title('Chebyshev 1')
% Ellip
[ze,pe,ke] = ellip(4, 3, 30, 50000*2*pi,'s');
[be,ae] = zp2tf(ze,pe,ke);
subplot(2,1,2);
splane(be,ae);
title('Elliptic');

% magnitude plot
[he,fe] = freqs(be,ae);
[hc,fc] = freqs(bc,ac);
dbe = mag2db(abs(he));
dbc = mag2db(abs(hc));
fe = fe/(2*pi*1000);
fc = fc/(2*pi*1000);

figure;
hold on
plot(fe,dbe)
plot(fc,dbc)
title('Magnitude Response');
xlabel('Frequency (kHz)');
ylabel('Magnitude (dB)');
legend('Elliptic', 'Chebyshev 1');
hold off

% phase plot
figure;
hold on
plot(fe, unwrap(angle(he))*180/pi);
plot(fc, unwrap(angle(hc))*180/pi);
title('Phase Response');
xlabel('Frequency (kHz)');
ylabel('Phase (degrees)');
legend('Elliptic','Chebyshev 1');
hold off

% Part f
L_c = dbc < -30;
L_e = dbe < -30;
chevy_index = find(L_c, 1, 'first');
ellip_index = find(L_e, 1 ,'first');
chevy_stopband_edge = fc(chevy_index)
ellip_stopband_edge = fe(ellip_index)


