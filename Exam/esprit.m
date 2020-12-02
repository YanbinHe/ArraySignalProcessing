function theta = esprit(X,d)
% estimate the angles of arrival
theta = zeros(d,1);
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
    theta(i) = asin(log(D(i,i))/(1*j*2*pi*0.5));
end
end

