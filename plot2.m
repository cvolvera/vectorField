xt = @(t) (2 + cos(1.5*t))*cos(t);
yt = @(t) (2 + cos(1.5*t))*sin(t);
zt = @(t) sin(1.5*t);
fplot3(xt, yt, zt, [-10 10])
