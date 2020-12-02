function [x,h] = gendata_conv(s,P,N,sigma)
% noiseless x(t) is derived from the convolution between h(t) and sk
% here we introduce a function which can be used to derive values of h(t)
% first we extend s to s_ext
% L = 1
s_ext = kron(s,[1;zeros(P-1,1)]);
h = zeros(P,1);
for i = 1:P
    h(i) = h_t((i-1)/P);
end
x = conv(h,s_ext);
x = x([1:N*P]);% noiseless x
noise = sqrt((sigma^2)/2)*(randn(N*P,1)+(1i * randn(N*P,1)));
% generate noise signal using sigma
x = x+noise;
end

