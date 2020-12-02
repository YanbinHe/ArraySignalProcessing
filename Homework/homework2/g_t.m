function gt = g_t(t)
%
if t<0 || t >2
    gt = 0;
end
if t>=0&& t<=1
    gt=t;
elseif t>1&&t<=2
    gt=2-t;
end
end

