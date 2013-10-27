function v = vcycle_rec(A,A2h,Ihto2h,I2htoh,f,v,N)

global w max_it vcycle_itr
v = weighted_jacobi(A, f, v, w, N,100);
if((N <= 64))
     v = f*inv(A);
     fprintf('V-cycle_rec: COARSE: %d\n' , norm(-v,inf));
    return
else
     
    vcycle_itr = vcycle_itr + 1;
    r2h = f - v*A;
  
    f2h = r2h*Ihto2h;
    
    v2h = zeros(round((N/2)-1),1)';

    [A4h, I4htoh , Ihto4h] = restriction(A2h ,N/2);
    fprintf('V-cycle_rec: Domain Down: %d\n' , N);
  
    v2h = vcycle_rec(A2h, A4h,Ihto4h,I4htoh,f2h,v2h,N/2);
    
  
    % CORRECRION
    %fprintf('Domain Up: %d\n' , N);
    v = v + v2h*I2htoh;
    fprintf('V-cycle_rec: Domain Up: %d error: %d\n' , N,norm(-v,inf));

    
end

end


