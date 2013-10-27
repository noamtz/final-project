function v = relaxation(A,A2h,Ihto2h,I2htoh,f,v,N)

global w max_it sizef sizeI

e = -v;
  fprintf('relaxation: e norm is: %d in Domain: %d\n' , norm(e,inf),N);
if(norm(e,inf) < 10^(-10))
    fprintf('relaxation Error Exited\n');
    return
end


if(N <= 64)
      
    [v , error] = weighted_jacobi(A,f,v,w,N,max_it);
      
else
    
    r2h = f - v*A;
  
    f2h = r2h*Ihto2h;
    
    v2h = zeros(round((N/2)-1),1)';

    [A4h, I4htoh , Ihto4h] = restriction(A2h ,N/2);
    %fprintf('Domain Down: %d\n' , N);
   
    
    v2h = relaxation(A2h, A4h,Ihto4h,I4htoh,f2h,v2h,N/2);

    % CORRECRION
    %fprintf('Domain Up: %d\n' , N);
    v = v + v2h*I2htoh;

    
end

end


