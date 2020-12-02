%% test 2
%% question 2
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
% h_ = blind_channel(X);
s_ = blind_symbol(X);
cluster = zeros();
k = 1;
for i = 1:N
    if real(s_(i))>0 && imag(s_(i))>0
        cluster(k) = s_(i);
        k = k + 1;
    end
end
s_est = mean(cluster);
Ratio = 1/s_est;
figure(1)
title('True versus Estimated')
plot(s,'^','markersize',5,'linewidth',10);
hold on
plot(s_*Ratio,'o');