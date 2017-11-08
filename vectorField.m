function vectorField(m, n, x0, xf, y0, yf,space)

syms x y;
%se convierten las funciones ingresadas a simbólicas
M = sym(m);
N = sym(n);

%se verifica si M y N son funciones de x o y o son constantes
if (has(M,x) || has(M,y)) && (has(N,x) || has(N,y) ) %M y N contienen x o y
  [x, y]=meshgrid(x0:space:xf, y0:space:yf);  %rejilla de puntos en el espacio en los intervalos ingresados
  u = double(subs(M));   %sustitución simbólica
  v = double(subs(N));
  
elseif (has(M,x) || has(M,y)) && ~(has(N,x) || has(N,y))  %M es una función de x o y, N es una constante
  [x, y]=meshgrid(x0:space:xf, y0:space:yf);
  u = double(subs(M));
  v = N*ones(size(u));  %se crea un arreglo de escalares
  
elseif ~(has(M,x) || has(M,y)) && (has(N,x) || has(N,y))  %M es una constante, N es una función de x o y
  [x, y]=meshgrid(x0:space:xf, y0:space:yf);
  v = double(subs(N));
  u = M*ones(size(v));

else  %M y N son constantes
  [x, y]=meshgrid(x0:space:xf, y0:space:yf);
  u = M*ones(size(x));
  v = N*ones(size(x));
end

figure
quiver(x,y,u,v)  %grafica vectores de velocidad como flechas con componentes u,v e los puntos x,y
hold on
grid on
