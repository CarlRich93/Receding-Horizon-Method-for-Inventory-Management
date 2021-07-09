function L = expected_cost(u, x, t)
% computes week t's expected stage cost using current end of week stock (x)
% and current end of week sotck update (u)  

%demand
p_d = [0.04, 0.09, 0.27, 0.4, 0.16, 0.02, 0.02];
d = [0, 1, 2, 3, 4, 5, 6];

L = 0;
for i = 1:length(d)
    L = L + stage_cost(u, x, d(i), t)*p_d(i); % compute weighted stage cost
end