function h = blind_channel(X)
%
[a,~] = size(X);
[s,~,~] = svd(X);
Un = s(:,[3:a]);% rank X = 2
Un_1 = Un([1:4],:);
Un_2 = Un([5:8],:);
U_t = zeros(12,4);
U_t([1:6],:) = Un_1';
U_t([7:12],:) = Un_2';
[~,~,D] = svd(U_t);
h = D(:,4);
end

