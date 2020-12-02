function y = spat_response(w,Delta,theta_range)
% plot the spatial response of a given beamformer w as a function of the 
% direction θ of a source with array response a(θ);
[M,~] = size(w);
[b,~] = size(theta_range);
y = [];
for i = 1:b
  a = gen_a(M,Delta,theta_range(i));
  y(i)=w'*a;
end
end

