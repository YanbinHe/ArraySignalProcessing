%% channel equalization
% some common values
P = 4;
N = 500;
sigma = 0.5;
s = source_2(N);
[x,h] = gendata_conv(s,P,N,sigma);
% first we can generate single-symbol-period X matrix, and reshape it to
% make this two-symbol-period matrix
X_inter = zeros(P,N);
for i = 1:N
    X_inter(:,i) = x([(i-1)*P+1:i*P]);
end
X = zeros(2*P,(N-1));
X([1:P],:) = X_inter(:,[1:(N-1)]);
X([(P+1):2*P],:) = X_inter(:,[2:N]);
% rank(X) = 2
% rank(X) = 2 if we double P
%% zero forcing and wiener equalizer
H = zeros(2*P,2);
H([1:P],1) = h;
H([(P+1):2*P],2) = h;
% zero-forcing
figure(1)
e = [1,0]';
w = pinv(H*H')*H*e;
s_est = w'*X;
plot(s_est,'.');
hold on
e = [0,1]';
w = pinv(H*H')*H*e;
s_est = w'*X;
plot(s_est,'o');
hold on
% wiener
figure(2)
Rn = diag(ones(2*P,1));
e = [1,0]';
w = (H*H'+sigma^2*Rn)^(-1)*H*e;
s_est = w'*X;
plot(s_est,'o');
hold on
e = [0,1]';
w = (H*H'+sigma^2*Rn)^(-1)*H*e;
s_est = w'*X;
plot(s_est,'.');
%% channel estimator
figure(3)
L=1;
h_est_ce = channel_estimator(x,s,L);
plot(real(h_est_ce),'bx','linewidth',25,'markersize',10)
hold on
plot(h,'ro','linewidth',25);
title('L = 1');
%% blind estimation
h_est = blind_channel(X);
figure(4)
plot(h,'x','markersize',10,'linewidth',25);
hold on
plot(real(h_est*2),'o','markersize',10,'linewidth',25);
title('Blind channel estimation')
s_est = blind_symbol(X);
figure(5)
plot(s,'x','markersize',10,'linewidth',25);
hold on
plot(s_est,'.');
title('Blind symbol estimation')