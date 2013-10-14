N = 64;
h = 1/N;
w =2/3;



A= (1/h^2)*(diag(ones(N-1,1)*2) + diag(-ones(N-2,1),-1) + diag(-ones(N-2,1),1));
f=zeros(N-1,1)';

i=[1:N-1];

v1 = sin(i*pi/N);
v03 = sin(i*3*pi/N);
v04 = sin(i*4*pi/N);
v16 = sin(i*16*pi/N);
v3 = sin(i*32*pi/N);
v6 = sin(i*64*pi/N);

vs = (1/6)*(v1+v6+v3+v03+v04+v16);
% vs = eig(A)';

[v , error] = weighted_jacobi(A,f,vs,w,N,10);
plot(error)
% plot(i,v1,i,v6,i,v3);
% figure
% plot(vs)
% figure
% plot(v)

rh = f - v*A;


I2htoh = [];%(1/2)*[1 0 0;2 0 0; 1 1 0; 0 2 0;0 1 1;0 0 2;0 0 1];

% Construct Prolonogation and restriction

ind = 1;
for i=1:(N/2-1)
    I2htoh(i,ind) = 1;
    I2htoh(i,ind+1) = 2;
    I2htoh(i,ind+2) = 1;
    ind = ind + 2;
end
I2htoh = (1/2)*I2htoh;
Ihto2h = (1/2)*transpose(I2htoh);


 r2h = rh*Ihto2h;
