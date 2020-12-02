function [X,sigma_square_noise] = gen_data1(h,s,P,N,SNR)
% construct a sampled version of the output x(t)
% which is the convolution between h(t) and s-delta(t)
% first we extend s to s_ext
snr_decimal = 10^(SNR/10);% transform dB in to linear
s_est = kron(s,[1;zeros(P-1,1)]);
% then do conv
x = conv(h,s_est);
% pick the first N*P samples up
x = x([1:N*P]);
sigma_square_signal = (x'*x)/(N*P);
sigma_square_noise = sigma_square_signal/snr_decimal;
X_inter = zeros(P,N);
Noise = zeros(P,N);
for i =1:N
    X_inter(:,i) = x([(i-1)*P+1:i*P]);
end
for i = 1:P
    for j = 1:N
        Noise(i,j) = sqrt(sigma_square_noise/2)*(randn(1) + (1i * randn(1)));
    end
end
X = X_inter+Noise;
end