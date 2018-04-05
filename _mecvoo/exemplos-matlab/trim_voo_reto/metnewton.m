function x = metnewton(f,x)

maxiter = 100;
tol = 1e-7;

for i = 1:maxiter
    fx = f(x);
    if max(abs(fx)) < tol
        return
    end
    
    J = jac(f,x);
    x = x -J\fx;
end

warning('Maximo de iteracoes excedido')