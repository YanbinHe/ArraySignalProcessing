% A_est = zeros(M,d);
% theta_est = sort(real(theta_est));
% for i = 1:d
%     A_est(:,i) = gen_a(M,Delta,theta_est(i));% based on esprit
% end
% W_doa = pinv(A_est)';
% S_est = W_doa'*X;
% figure(3)
% plot(S_est,'o');
% hold on
% plot(S,'x');
% S_est = zeros(d,N);
% fre_est = sort(real(fre_est));
% for i = 1:d
%     for j = 1:N
%         S_est(i,j) = source(N,fre_est(i),j);
%     end
% end
% A_hat = X*pinv(S_est);% estimate A
% W_fre = pinv(A_hat)';
% S_est = W_fre'*X;
% figure(4)
% plot(S_est,'o');
% hold on
% plot(S,'x');