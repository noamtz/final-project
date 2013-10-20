function v = fmg(A,A2h,Ihto2h,I2htoh,f,v,N)
%FMG Summary of this function goes here
%   Detailed explanation goes here

if(N <= 64)
     %[v , error] = weighted_jacobi(A,f,v,2/3,N,3);
else

    r2h = f - v*A;
    
    f2h = r2h*Ihto2h;
    
    v2h = v*Ihto2h;
    
    [A4h, I4htoh , Ihto4h] = restriction(A2h ,N/2);


    v2h = fmg(A2h,A4h,Ihto4h,I4htoh ,f2h,v2h,N/2);

    % Set Initial guess
    v = v2h*I2htoh;
 
    
    v = vcycle(A, v, f, N);
     v = vcycle(A, v, f, N);
     v = vcycle(A, v, f, N);
%     v = vcycle(A, v, f, N);
end

end   
