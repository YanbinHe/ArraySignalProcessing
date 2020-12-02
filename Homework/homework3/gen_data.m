function X = gen_data(M,N,Delta,theta,SNR)
% generate a data matrix X = AS+N as function of the directions 
% θ = [θ 1 · · · θ d ] T , number of antennas M, number of samples N, 
% and signal-to-noise ratio (SNR) in dB (the SNR is deﬁned as the ratio 
% of the source power of a single user over the noise power). S and N 
% are respectively a d × N and M × N random zero-mean complex Gaussian matrix;
% transfer SNR into the ratio of power
snr_decimal = 10^(SNR/10);% transform dB in to linear
%% generate A matrix
% first generate the columns of A using gen_a(M,Delta,theta(single value)) function and then combine them
[d,~]=size(theta);
A = zeros(M,d);
for k = 1:d
   a = gen_a(M,Delta,theta(k));
   A(:,k) = a;
end
%% generate S matrix and N matrix
% There are two ways to do that. One is to generate one S vector and then
% generate the corresponding X (here X should be a vecotr), and then
% calculate the power of X and using this power to derive the power of the
% noise and then generate the corresponding noise vector.
% Finally combine all of them.
X = zeros(M,N);
for l = 1:N
    for k = 1:d
        Noise = zeros(M,1);
        S_inter = source(1);
        X_inter = A(:,k)*S_inter;
        sigma_square_user = X_inter'*X_inter/M;
        sigma_square_noise = sigma_square_user/snr_decimal;
    for j = 1:M
        Noise(j,1) = sqrt(sigma_square_noise/2)*(randn(1) + (1i * randn(1)));
    end
        X(:,l) = X(:,l)+X_inter+Noise;
    end
end
end

