global max_it w sizef  sizeI 
tic;
N = 2048;
h = 1/N;
w = 2/3;
max_it = 1;



tic;

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

[ A2h , I2htoh, Ihto2h] = restriction( A , N );

v =  fmg(A,A2h,Ihto2h,I2htoh,f,vs,N);
%v = vcycle(A, vs, f, N);

plot(v)

toc