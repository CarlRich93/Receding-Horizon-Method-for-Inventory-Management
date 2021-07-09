function d = sample()
demand = [0.04, 0.09, 0.27, 0.4, 0.16, 0.02, 0.02];
x = rand;
d=0;
for i = 1:length(demand)
    if (sum(demand(1:i)) < x) && (sum(demand(1:i+1)) >= x)
        d=i;
    end
end
end