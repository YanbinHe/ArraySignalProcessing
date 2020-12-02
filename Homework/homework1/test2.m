%% test 2
%% question 2
tau = [0.1,0.6]';
% generate beta vector
ph1 = rand()*2*pi;
ph2 = rand()*2*pi;
beta = [exp(1i*ph1),0.7*exp(1i*ph2)]';
%% generate x and X
P = 5;
N = 50;
L = 2;
h = channel(tau,beta,L,P);
s = source(N);
x = gen_data1(h,s,P,N);
X = zeros(P,N);
for i =1:N
    X(:,i) = x([(i-1)*P+1:i*P]);
end
r = rank(X);