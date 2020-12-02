function fre = espritfreq(X,d)
% estimate the frequency of arrival signals
% The X^H matrix has the same structure as X for DOA
fre = zeros(d,1);
[M,N] = size(X);
X_sub = X([1:M-1],:);
Y_sub = X([2:M],:);
Z = zeros(2*(M-1),N);
Z([1:M-1],:) = X_sub;
Z([M:2*(M-1)],:) = Y_sub;
[s,v,~] = svd(Z);
u = s(:,[1:d]);
u_x = u([1:M-1],:);
u_y = u([M:2*(M-1)],:);
inter = pinv(u_x)*u_y;
[~,D,~] = eig(inter);
for i = 1:d
    fre(i) = -log(D(i,i))/(1j*2*pi);% because I use hermitian;
end
end
