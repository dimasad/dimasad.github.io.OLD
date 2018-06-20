xref = [1;0];
uref = 0;

fx = @(x) f(x, uref);
fu = @(u) f(xref, u);

A = jac(fx, xref);
B = jac(fu, uref);
