%% test 1
%% the results in this part are about the spatial response for fixed w
% results are in 20/21/23/24 pages of the slide
theta_range = [-0.5*pi:0.001*pi:0.5*pi]';
M1 = 2;
M2 = 3;
M3 = 7;
Delta = 0.5;
w1 = ones(M1,1);
w2 = ones(M2,1);
w3 = ones(M3,1);
w4 = gen_a(M3,Delta,pi/6);
w5 = gen_a(M3,Delta,pi/15);
y1 = spat_response(w1,Delta,theta_range);% page 20
y2 = spat_response(w2,Delta,theta_range);% page 21 left
y3 = spat_response(w3,Delta,theta_range);% page 21 right
y4 = spat_response(w4,Delta,theta_range);% page 24
y5 = spat_response(w3,1,theta_range);%page 23 left-down
y6 = spat_response(w3,2,theta_range);%page 23 right_down
y7 = spat_response(w3+w4,Delta,theta_range);% page 25 left
y8 = spat_response(w3+w5,Delta,theta_range);% page 25 right
x_axis = [-90:0.18:90];
figure(1)
plot(x_axis,abs(y1))
title('Spatial response for fixed w')
xlabel('Degree');
figure(2)
plot(x_axis,abs(y2))
xlabel('Degree');
title('Spatial response for fixed w')
figure(3)
plot(x_axis,abs(y3))
xlabel('Degree');
title('Spatial response for fixed w')
figure(4)
plot(x_axis,abs(y4))
xlabel('Degree');
title('Spatial response for fixed w')
figure(5)
plot(x_axis,abs(y5))
xlabel('Degree');
title('Spatial response for fixed w')
figure(6)
plot(x_axis,abs(y6))
xlabel('Degree');
title('Spatial response for fixed w')
figure(7)
plot(x_axis,abs(y7))
xlabel('Degree');
title('Response for scanning w')
figure(8)
plot(x_axis,abs(y8))
xlabel('Degree');
title('Response for scanning w')
%% generate X, and then do SVD
% 2 sources, 5antennas, 10 samples
M = 5;
N = 10;
Delta = 0.5;
index = [1:1:M];
theta1 = [-pi/4,pi/4]';
theta2 = [-pi/6,pi/6]';
theta3 = [-pi/144,pi/144]';
%% this is for DOA
SNR = 20;
X1 = gen_data(M,N,Delta,theta1,SNR);
s1 = svd(X1);
X2 = gen_data(M,N,Delta,theta2,SNR);
s2 = svd(X2);
X3 = gen_data(M,N,Delta,theta3,SNR);
s3 = svd(X3);
%% this is for number of samples
SNR = 20;
N1 = 10;
N2 = 100;
N3 = 500;
X1 = gen_data(M,N1,Delta,theta1,SNR);
s1 = svd(X1);
X2 = gen_data(M,N2,Delta,theta1,SNR);
s2 = svd(X2);
X3 = gen_data(M,N3,Delta,theta1,SNR);
s3 = svd(X3);
%% this is for SNR
SNR1 = 30;
X1 = gen_data(M,N,Delta,theta1,SNR1);
s1 = svd(X1);
SNR2 = 20;
X2 = gen_data(M,N,Delta,theta1,SNR2);
s2 = svd(X2);
SNR3 = 10;
X3 = gen_data(M,N,Delta,theta1,SNR3);
s3 = svd(X3);
SNR4 = 0;
X4 = gen_data(M,N,Delta,theta1,SNR4);
s4 = svd(X4);
% 

figure(9)
scatter(index,s1,80,'x');
hold on
scatter(index,s2,80,'filled');
hold on
scatter(index,s3,80,'filled','^');
hold on
scatter(index,s4,80,'filled','<');

%% this is for different numbers of antenna
theta = [-pi/6,pi/6]';
M1 = 5;
index1 = [1:1:min(M1,N)];
X1 = gen_data(M1,N,Delta,theta,SNR);
s1 = svd(X1);

M2 = 10;
index2 = [1:1:min(M2,N)];
X2 = gen_data(M2,N,Delta,theta,SNR);
s2 = svd(X2);

M3 = 15;
index3 = [1:1:min(M3,N)];
X3 = gen_data(M3,N,Delta,theta,SNR);
s3 = svd(X3);
% 
figure(10)
scatter(index1,s1,80,'x');
hold on
scatter(index2,s2,80,'filled');
hold on
scatter(index3,s3,80,'filled','^');
hold on