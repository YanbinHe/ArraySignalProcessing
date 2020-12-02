%% test 2
%% question 2
tau = [0.1,0.6]';
% generate beta vector
ph1 = rand()*2*pi;
ph2 = rand()*2*pi;
beta = [exp(1i*ph1),0.7*exp(1i*ph2)]';
%% generate x and X
P = 5;
N = 1000;
L = 2;
SNR = 5;
h = channel(tau,beta,L,P);
s = source(N);
[X,sigma] = gen_data1(h,s,P,N,SNR);
%% Design wiener filter
col1 = 1; % column of the H matrix
col2 = 2;
% generate H matrix
H = zeros(P,L);
for i =1:L
    H(:,i) = h([(i-1)*P+1:i*P]);
end
w1 = (H*H'+sigma*eye(P))^(-1)*H(:,col1);
s_est1 = w1'*X;
figure(1)
subplot(1,2,1)
plot(s_est1,'x');
hold on
% plot(X,'x');
w2 = (H*H'+sigma*eye(P))^(-1)*H(:,col2);
s_est2 = w2'*X;
subplot(1,2,2)
plot(s_est2,'x');
hold on