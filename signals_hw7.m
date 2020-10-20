% Question 1 part c
A = [3/10, 1; 2/5, 0];
B = [15/20; 9/10];
C = [1, 0];
D = [1/2];
[b,a] = ss2tf(A,B,C,D);

% Question 1 part d
A2 = A.';
B2 = C.';
C2 = B.';
D2 = D.';
[b2, a2] = ss2tf(A2,B2,C2,D2);

% Question 1 part e
[A3, B3, C3, D3] = tf2ss(b2, a2);

% Question 1 Part F
T = [5 2; 7 3];
A_T = T*A*inv(T);
B_T = T*B;
C_T = C*inv(T);
D_T = D;
[b_T,a_T] = ss2tf(A_T,B_T,C_T,D_T); % b_t == b_T and a_t == a_T

% Question 3
A = [139.3 -263 -135; 83 -156.7 -80.4; -18 34 17.5];
% Question 3 Part A
E = eig(A);
% Question 3 Part B
I = eye(3);
syms z
F = inv(z*I-A);
F = z*F;
phi = iztrans(F);

% Question 3 Part C
X = [1;1;1];
for i = 1:40
    X = [X, A*X(:,i)];
end
L = [];
for i = 1:41
    L = [L norm(X(:,i))];
end

% Question 3 Part D
N = 0:40;
L_decibel = 20*log(L);
figure;
stem(N,L_decibel);
% if X->0, length(X) should approach -infinity

% Question 3 Part F
N = 40;
A_N = A^N;
phiN = double(subs(phi,'n', 40));
maxError = max(max(abs(A_N-phiN)));

% Question 4 part A
normA =norm(A);
E2 = eig(A.'*A);
normA2 = sqrt(max(E2)); % normA == normA2. Wow!


% Question 4 part B
XQ = [1;1;1];
for j = 1:5
    XQ(:,j);
    XQ = [XQ, A*XQ(:,j)];
    for k = 1:3
        if XQ(k,j+1) > 127
            XQ(k,j+1) = 127;
        elseif XQ(k,j+1) < -128
                XQ(k,j+1) = -128;
        end 
    end
end