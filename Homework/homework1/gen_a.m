function a = gen_a(M,Delta,theta)
% generate the array response a(θ) of a uniform linear array with M elements 
% and spacing ∆ wavelengths to a source coming from direction θ degrees;
a = zeros(M,1);
for i = 1:M
    a(i)=exp(1j*2*pi*(i-1)*Delta*sin(theta));
end
end

