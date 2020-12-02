function h = pilot(X,s)
% just compute the pinv?
[P,N] = size(X);
L = 3;
S_L = zeros(L,N);
for i = 1:L
    for j = 1:N
        S_L(i,j+i-1) = s(j);
    end
end
S_L = S_L(([1:L]),([1:N]));
H = X*pinv(S_L);
[a1,a2] = size(H);
h = zeros(L*P,1);
ll = 1;
for i = 1:a2
    for j = 1:a1
        h(ll) = H(j,i);
        ll = ll + 1;
    end
end
end

