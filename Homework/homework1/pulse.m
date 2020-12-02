function g = pulse(tau,L,P)
% here we define a g(t) function to retreive the value of 
% g(t) such that we don't have to calculate the value of the 
% entries of g(tau)
g = zeros(P*L,1);
tag = 1;
for i = 1:L
    for j = 1:P
        g(tag) = g_t(i-1+(j-1)/P-tau);
        tag = tag + 1;
    end
end
end

