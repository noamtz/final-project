function [v , error] = weighted_jacobi(A, f, v, w, N,maxi)

h = 1/N;

D = diag(diag(A,0),0);
U = -triu(A,1);
L = -tril(A,-1);

Dinv = inv(D);

Rj = Dinv*(L+U);

[n,m] = size(A);

I = eye(n,m);

Rw = (1-w)*I + w*Rj;

e = -v;
error = [];

for j=1:maxi
    e = -v;
    error = [error norm(e, inf)];
    v = v*Rw + w*(h^2)*f*Dinv;
end

end
