function h = blind_channel(X)
% 
[S,V,D] = svd(X);
U_n = S(:,([4:5]));
% Construct U_T
[a1,a2] = size(U_n');
U_T = zeros(6,3*a2);
U_T(([1:2]),([1:5]))=U_n';
U_T(([3:4]),([6:10]))=U_n';
U_T(([5:6]),([11:15]))=U_n';
[S_,V_,D_] = svd(U_T);
end

