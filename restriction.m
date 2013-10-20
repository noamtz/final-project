function [ A2h , I2htoh, Ihto2h] = restriction( Ah , N )
%RESTRICTION Summary of this function goes here
%   Detailed explanation goes here

I2htoh = [];



ind = 1;
for j=1:(N/2-1)
    I2htoh(j,ind) = 1;
    I2htoh(j,ind+1) = 2;
    I2htoh(j,ind+2) = 1;
    ind = ind + 2;
end

I2htoh = (1/2)*I2htoh;
Ihto2h = (1/2)*transpose(I2htoh);

A2h = I2htoh*Ah*Ihto2h;

end

