function h = channel_estimator(x,s,L)
% 
[N,~] = size(s);
[NP,~] = size(x);
P = NP/N;
% % x = flip(x);
% S = zeros(N,L);
% for i = 1:N
%     for j = 1:L
%         if N+1-i-j+1<=0
%             S(N+1-i,j) = 0;
%         else
%         S(N+1-i,j) = s(N+1-i-j+1);
%         end
%     end
% end
% inter = kron(S,ones(P,P));
% % first construct X matrix
% X = zeros(P,N);
% for i = 1:N
%     X(:,i) = x([(i-1)*P+1:i*P]);
% end
% x_new = zeros(N*P,1);
% for i = 1:N
%     x_new([(i-1)*P+1:i*P]) = X(:,N-i+1);
% end
% h = pinv(inter)*x_new;
X = zeros(P,N);
for i = 1:N
    X(:,i) = x([(i-1)*P+1:i*P]);
end
S = zeros(L,N);
for l = 1:L
    if l >1 
        for k = 1:l-1
            s = [0 s'];
            s = s';
        end
    end
    s = s([1:N]);
    S(l,:) = s;
end
h = X*pinv(S);
end

