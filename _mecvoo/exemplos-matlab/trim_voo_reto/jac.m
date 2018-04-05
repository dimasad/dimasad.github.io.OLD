function J = jac(f, xref)
% Calcula jacobiana da função f(x) avaliada no ponto xref

fref = f(xref);

nf = length(fref);
nx = length(xref);

J = zeros(nf, nx);
for j = 1:nx
    dxj = 1e-8;
    x_pert = xref;
    x_pert(j) = xref(j) + dxj;
    
    f_pert = f(x_pert);
    df = (f_pert - fref);
    J(:, j) = df / dxj;
end
