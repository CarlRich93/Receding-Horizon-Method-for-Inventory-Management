function [u_evol, x_evol, J_evol, cost_evol, total_cost] = RHM3(Ny,Nu,r,T,d,d_pred)

% Record weekly stock orders, stock level, weekly cost and optimal objective
u_evol = zeros(1,T+1); x_evol = zeros(1,T+1); cost_evol = zeros(1,T+1); J_evol = zeros(1,T+1);

% Simulate system
x = 0; t=0; % initialise system
[u_star, ~] = optimise_step3(x,t,Ny,Nu,d_pred); % optimal u before shop opens (prediction and optimize u)

% record results
x_evol(1) = x;
u_evol(1) = u_star;
J_evol(1) = 0;
cost_evol(1) = 0;
    
for t = 1:T
    
    % Stock dynamics
    x = x + u_star - d(t); %
    cost = weekly_cost(x,t); % costs at end of week t
    
    % prevents stock dropping below 0
    if x < 0
        x = 0;
    end
    
    % update stock?
    if (x <= r) && (t<52) % update stock if below threshold
        [u_star, J_star] = optimise_step3(x,t,Ny,Nu,d_pred); % optimal u for t+1
    else
        u_star = 0; J_star=0;
    end
    
    % record results
    x_evol(t+1) = x;
    u_evol(t+1) = u_star;
    J_evol(t+1) = J_star;
    cost_evol(t+1) = cost;
end

% total cost and its horizon policy
total_cost = [sum(cost_evol), Ny, Nu];

end
