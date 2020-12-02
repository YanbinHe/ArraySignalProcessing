function X = gen_data(M,N,Delta,theta,SNR)
% generate a data matrix X = AS+N as function of the directions 
% θ = [θ 1 · · · θ d ] T , number of antennas M, number of samples N, 
% and signal-to-noise ratio (SNR) in dB (the SNR is deﬁned as the ratio 
% of the source power of a single user over the noise power). S and N 
% are respectively a d × N and M × N random zero-mean complex Gaussian matrix;
% transfer SNR into the ratio of power
sigma_square_noise = 0.01;% power of noise
snr_decimal = 10^(SNR/10);% transform dB in to linear
sigma_square_user = sigma_square_noise*snr_decimal;% derive the power of the users' signal
%% generate A matrix
% first generate the columns of A using gen_a(M,Delta,theta(single value)) function and then combine them
[d,~]=size(theta);
A = zeros(M,d);
for k = 1:d
   a = gen_a(M,Delta,theta(k));
   A(:,k) = a;
end
%% generate S matrix and N matrix
% S is d*N, Noise is M*N, and each entry of these two matirx is generated
% by a complex Gaussian random variable with sigma square, which is related
% to the power of the signal
% sqrt(var/2)*(randn(1,N)+i*randn(1,N))
S = sqrt(sigma_square_user/2)*(randn(d,N) + (1i * randn(d,N)));
Noise = sqrt(sigma_square_noise/2)*(randn(M,N) + (1i * randn(M,N)));

X = A*S+Noise;
end

