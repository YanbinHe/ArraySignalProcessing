function s_ = blind_symbol(X)
%
[S,V,D] = svd(X);
V_n = D(:,[4:100]);
V_t = zeros(102,97*3);
V_t([1:100],[1:97]) = V_n;
V_t([2:101],[98:2*97]) = V_n;
V_t([3:102],[2*97+1:3*97]) = V_n;
[s,v,d]=svd(V_t);
s_ = s([3:102],102);
end

