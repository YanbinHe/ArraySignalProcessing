function [w,y] = cma_algo(X,mu,w_init,flag)
% cma (2,2) is implemented
[~,N] = size(X);
y = zeros(1,N);
w = w_init;
for i = 1:N
    y(i) = w'*X(:,i);
    if flag == 1
        w = w-mu*X(:,i)*(y(i)*conj(y(i))-1)*conj(y(i));
    else
        w = w-mu*X(:,i)*(conj(y(i))-conj(y(i))/abs(y(i)));
end
end

