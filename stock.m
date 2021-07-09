function x = stock(u,x,d)
% stock dynamics
x = x + u - d;
end