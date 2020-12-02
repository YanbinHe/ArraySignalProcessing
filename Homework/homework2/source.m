function s = source(N)
% construct a source sequence s
s = zeros(N,1);
for i = 1:N
    seed = rand(1);
    if seed>=0&&seed<0.25
        s(i)=1;
    elseif seed>=0.25&&seed<0.5
        s(i)=1i;
    elseif seed>=0.5&&seed<0.75
        s(i)=-1;
    elseif seed>=0.75&&seed<=1
        s(i)=-1i;
    end
end
end

