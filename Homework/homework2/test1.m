theta = [0,pi/6]';
M = 4;
Delta = 0.5;
N = 1000;
SNR = 20;
X = gen_data(M,N,Delta,theta,SNR);
% plot(X(1,:),'x');
figure(2)
%% matched filter
[d,~]=size(theta);
A = zeros(M,d);
for k = 1:d
   a = gen_a(M,Delta,theta(k));
   A(:,k) = a;
end
% [S,V,D]=svd(A);
Rn = 0.01*eye(M);
w = A(:,1);
s_est = w'*X;
plot(s_est(1,:),'x');
%% Zero forcing
w = pinv(A);
w_zf = w(2,:);
s_est = w_zf*X;
% plot(s_est(1,:),'x');
%% wiener filter
w = (A*A'+Rn)^(-1)*A;
w_wf = w(:,2);
s_est = w_wf'*X;
% plot(s_est(1,:),'x');
theta_scan = [-0.5*pi:0.01*pi:0.5*pi];
y1_1 = zeros(length(theta_scan),1);
y1_2 = zeros(length(theta_scan),1);
for i = 1:length(theta_scan)
    y1_1(i) = abs(w_zf*gen_a(M,Delta,theta_scan(i)));
    y1_2(i) = abs(w_wf'*gen_a(M,Delta,theta_scan(i)));
end
plot(theta_scan,y1_1,'x');
hold on
plot(theta_scan,y1_2,'o');
%% Estimating DOA
T = [-0.5*pi:0.01*pi:0.5*pi];
x_axis = [-90:1.8:90];
Rx = (1/N)*(X*X');
Rx = zeros(4,4);
for i = 1:100
    Rx = Rx + X(:,i)*X(:,i)';
end
Rx = (1/N)*Rx;
figure(1)
%% beamformer
[~,e] = size(T);
result1 = zeros(e,1);
for t = 1:e
    a = gen_a(M,Delta,T(t));
    result1(t) = (a'*Rx*a)/(a'*a);
end
plot(x_axis,10*log(real(result1))/log(10),'o-');
hold on
%% MUSIC
[S,V,D] = svd(Rx);
Un = S(:,[3:4]);% since we only have two sources
[~,e] = size(T);
result2 = zeros(e,1);
for t = 1:e
    a = gen_a(M,Delta,T(t));
    result2(t) = 1/(a'*(Un*Un')*a);
%     (a'*a)
end
plot(x_axis,10*log(real(result2))/log(10),'+-');
hold on
%% MVDR
[~,e] = size(T);
result3 = zeros(e,1);
for t = 1:e
    a = gen_a(M,Delta,T(t));
    result3(t) = 1/(a'*Rx^(-1)*a);
end
plot(x_axis,10*log(real(result3))/log(10),'x-');
hold on