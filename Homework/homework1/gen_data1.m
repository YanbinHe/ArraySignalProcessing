function x = gen_data1(h,s,P,N)
% construct a sampled version of the output x(t)
% which is the convolution between h(t) and s-delta(t)
% first we extend s to s_ext
s_est = kron(s,[1;zeros(P-1,1)]);
% then do conv
x = conv(h,s_est);
% pick the first N*P samples up
x = x([1:N*P]);
end