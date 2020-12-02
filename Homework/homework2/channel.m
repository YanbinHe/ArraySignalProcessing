function h = channel(tau,beta,L,P)
% constructchannel response resulting from r paths with delays tau
% and gains beta
% here I assume that we only have one antenna at our receiver.
% Thus we just assign 1 to a(theta) vector.
% we can use g function
[t,~]=size(tau);
one = ones(t,1);
in = zeros(t,L*P);
for i = 1:t
    in(i,:)=pulse(tau(i),L,P)*beta(i);
end
h = in.'*one;
end

