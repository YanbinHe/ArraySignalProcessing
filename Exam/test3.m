%% estimation performance
% some common values
Delta = 1/2;
d = 2;
M = 3;
N = 20;
theta = [-pi/9,pi/6]';
f = [0.1,0.12]';
SNR_value = [0,4,8,12,16,20];
theta_mean = zeros(2,6);
fre_mean = zeros(2,6);
theta_stan = zeros(2,6);
fre_stan= zeros(2,6);
for j = 1:6
SNR = SNR_value(j);
fre_fi = zeros(1000,d);
theta_fi = zeros(1000,d);
for i = 1:1000
    [X,A,S] = gendata(M,N,Delta,theta,f,SNR);
    theta_est = esprit(X,d);
    fre_est = espritfreq(X',d);
    theta_est = sort(real(theta_est));
    fre_est = sort(real(fre_est));
    theta_fi(i,:) = theta_est;
    fre_fi(i,:) = fre_est;
end
% mean values
theta_mean(:,j) = mean(theta_fi);
fre_mean(:,j) = mean(fre_fi);
% standard deviations
theta_stan(:,j) = sqrt(var(theta_fi));
fre_stan(:,j) = sqrt(var(fre_fi));
end
x_axis = [1:6];

figure(1)
plot([1:6],theta_mean');
line([1,6],[-pi/9,-pi/9],'linestyle',':');
line([1,6],[pi/6,pi/6],'linestyle',':');
grid on

figure(2)
plot([1:6],fre_mean');
line([1,6],[0.1,0.1],'linestyle',':');
line([1,6],[0.12,0.12],'linestyle',':');
grid on


figure(3)
plot(x_axis,theta_stan');
plot(x_axis,fre_stan');
grid on


