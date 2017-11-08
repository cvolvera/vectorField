xt = @(t) (4 + sin(20*t))*cos(t);
yt = @(t) (4 + sin(20*t))*sin(t);
zt = @(t) cos(20*t);
fplot3(xt, yt, zt)
