function s_est = blind_symbol(X)
%
[a,b] = size(X);
[s,v,d] = svd(X);
Vn = d(:,[3:b]);
V_t = zeros(b+1,2*(b-2));
V_t([1:b],[1:(b-2)]) = Vn;
V_t([2:(b+1)],[(b-1):2*(b-2)]) = Vn;
[U,E,V] = svd(V_t);
s_est = U(:,500);
end

