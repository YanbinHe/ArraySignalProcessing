%% estimation of directions and frequencies
% some common values
Delta = 1/2;
d = 2;
M = 3;
N = 20;
theta = [-pi/9,pi/6]';
% theta = [0,pi/12]';
f = [0.1,0.12]';
SNR = 10;
%% Singular values of X
[X,A,S] = gendata(M,N,Delta,theta,f,SNR);
% figure(1)
% v = svd(X);
% plot(v,'o','linewidth',30);
% hold on
%% estimation of direction using esprit
theta_est = esprit(X,d);
% plot(theta,'x','markersize',20,'linewidth',30);
% hold on
% plot(sort(real(theta_est)),'o','linewidth',30,'markersize',10);
% legend('True','Estimated');
%% estimation of frequency
fre_est = espritfreq(X',d);
% plot(f,'x','markersize',20,'linewidth',30);
% hold on
% plot(sort(real(fre_est)),'o','linewidth',30,'markersize',10);
% legend('True','Estimated');
%% Zero-forcing receiver for DOA
A_est = zeros(M,d);
theta_est = sort(real(theta_est));
for i = 1:d
    A_est(:,i) = gen_a(M,Delta,theta_est(i));% based on esprit
end
W_doa = pinv(A_est)';
S_est = W_doa'*X;
% figure(3)
% plot(S_est,'bo');
% hold on
% plot(S,'rx');
%% Zero-forcing receiver for fre
S_est = zeros(d,N);
fre_est = sort(real(fre_est));
for i = 1:d
    for j = 1:N
        S_est(i,j) = source(N,fre_est(i),j);
    end
end
A_hat = X*pinv(S_est);% estimate A
W_fre = pinv(A_hat)';
S_est = W_fre'*X;
% figure(4)
% plot(S_est,'bo');
% hold on
% plot(S,'rx');
%% plot the spatial response
theta_scan = [-0.5*pi:0.01*pi:0.5*pi];
y1_1 = zeros(length(theta_scan),1);
y1_2 = zeros(length(theta_scan),1);
y2_1 = zeros(length(theta_scan),1);
y2_2 = zeros(length(theta_scan),1);
for i = 1:length(theta_scan)
    y1_1(i) = abs(W_doa(:,1)'*gen_a(M,Delta,theta_scan(i)));
    y1_2(i) = abs(W_doa(:,2)'*gen_a(M,Delta,theta_scan(i)));
    y2_1(i) = abs(W_fre(:,1)'*gen_a(M,Delta,theta_scan(i)));
    y2_2(i) = abs(W_fre(:,2)'*gen_a(M,Delta,theta_scan(i)));
end
% figure(5)
% plot(theta_scan,y1_1,'-x');
% hold on
% plot(theta_scan,y1_2,'-x');
% line([-pi/9,-pi/9],[0,1.2],'linestyle',':');
% line([pi/6,pi/6],[0,1.2],'linestyle',':');
% figure(6)
% plot(theta_scan,y2_1,'-o');
% hold on
% plot(theta_scan,y2_2,'-o');
% line([-pi/9,-pi/9],[0,1.2],'linestyle',':');
% line([pi/6,pi/6],[0,1.2],'linestyle',':');
%% cma algorithm
Delta = 1/2;
d = 2;
M = 3;
N = 5000;
theta = [-pi/9,pi/6]';
f = [0.1,0.12]';
SNR = inf;
mu = 0.001;
[X,A,S] = gendata(M,N,Delta,theta,f,SNR);
w_init = ones(M,1);
% w_init = [0,0.256,-sqrt(3)]';
[w_final,y] = cma_algo(X,mu,w_init,1);
% plot(abs(y));
% w_final = w_final*exp(1j*0.475*pi);
theta_scan = [-0.5*pi:0.01*pi:0.5*pi];
y_cma = zeros(length(theta_scan),2);
for i = 1:length(theta_scan)
    y_cma(i) = abs(w_final'*gen_a(M,Delta,theta_scan(i)));
end
figure(7)
plot(theta_scan*180/pi,y_cma,'-x');
hold on
figure(8)
y_est = w_final'*X;
plot(y_est,'o');
hold on
plot(S(1,:),'x');