%% test 1
%% question 1
tau = [0.1,0.6]';
% generate beta vector
ph1 = rand()*2*pi;
ph2 = rand()*2*pi;
beta = [exp(1i*ph1),0.7*exp(1i*ph2)]';
%% generate x and X
P = 5;
N = 100;
L = 3;
SNR = 30;
s = source(N);
h = channel(tau,beta,L,P);
X = gen_data1(h,s,P,N,SNR);
h_ = pilot(X,s);
figure(1)
title('True versus Estimated')
plot(h,'x');
hold on
plot(h_,'o');