function v = vcycle(A, vs, f, N)

if(max(vs) == 0)
    fprintf('V-CYCLE: e norm is: 0 in Domain: %d\n' ,N);

    return
end

[ A2h , I2htoh, Ihto2h] = restriction( A , N );

v = relaxation(A,A2h,Ihto2h,I2htoh,vs,f,N);

end