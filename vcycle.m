function v = vcycle(A, vs, f, N)


error = norm(-vs,inf);
%  fprintf('V-cycle:  domain= %d , error= %d \n' , N, error);
if(error < 10^(-10) | N <= 64)
    v = vs;
    return
end

[ A2h , I2htoh, Ihto2h] = restriction( A , N);

v = vcycle_rec(A,A2h,Ihto2h,I2htoh,f,vs,N);

end