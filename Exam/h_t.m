function value = h_t(t)
if t>=0 && t<0.25
    value = 1;
elseif t>=0.25 && t<0.5
    value = -1;
elseif t>=0.5 && t<0.75
    value = 1;
elseif t>=0.75 && t<1
    value = -1;
end
end

