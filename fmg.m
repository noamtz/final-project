function v = fmg(A,A2h,Ihto2h,I2htoh,f,v,N)


if(N <= 2048)
     %[v , error] = weighted_jacobi(A,f,v,2/3,N,3);
else
    % Residual equation
    r2h = f - v*A;
    % Moving residual to h2
    f2h = r2h*Ihto2h;
    % Moving v to h2
    v2h = v*Ihto2h;
    % Getting next grid
    [A4h, I4htoh , Ihto4h] = restriction(A2h ,N/2);

    
    v2h = fmg(A2h,A4h,Ihto4h,I4htoh ,f2h,v2h,N/2);

    % Set Initial guess
    v = v2h*I2htoh;
    


     v = vcycle(A, v, f, N);
     %v = vcycle(A, v, f, N);
     %v = vcycle(A, v, f, N);
     

%     v = vcycle(A, v, f, N);
end

end   
