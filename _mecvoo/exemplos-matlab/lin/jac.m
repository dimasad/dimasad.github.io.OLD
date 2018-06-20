function J = jac(h, zref)
% Calcula matriz jacobiana por diferencas finitas

delta = 1e-7;
href = h(zref);

nh = length(href);
nz = length(zref);

J = zeros(nh, nz);
for j = 1:nz
    z_pert = zref;
    z_pert(j) = zref(j) + delta;
    
    h_pert = h(z_pert);
    J(:, j) = (h_pert - href) / delta;
end
