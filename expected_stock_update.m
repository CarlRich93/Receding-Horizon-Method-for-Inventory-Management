function x = expected_stock_update(u,x)
% stock dynamics
x = x + u - 3; % 3 is the expected weekly demand
end