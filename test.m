
N = 10;
h = 1/N;
w = 2/3;
max_it = 1;
vcycle_itr = 0;




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


%1
[ A2h , I2htoh, Ihto2h] = restriction( A , N );


% tic
% %2
% r2h = f - vs*A;
% toc;
% 
% tic
% %3
% f2h = r2h*Ihto2h;
% toc;  
% 
% tic
% %4
% v2h = zeros(round((N/2)-1),1)';
% toc;  
% 
% tic
% %5
% v = v2h*I2htoh;
% toc;