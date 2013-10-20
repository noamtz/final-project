function v = vcycle(A, vs, f, N)

[ A2h , I2htoh, Ihto2h] = restriction( A , N );

v = relaxation(A,A2h,Ihto2h,I2htoh,vs,f,N);

end