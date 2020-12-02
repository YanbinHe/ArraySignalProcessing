function s = source(N,fre,time)
% construct a source sequence s
s = zeros(N,1);
for i = 1:N
    s = exp(1j*2*pi*fre*time);
end
end

