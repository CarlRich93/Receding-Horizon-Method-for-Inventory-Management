function [u_star,J] = optimise_step1(x,t_now,Ny,Nu)
% returns the optimal u according to policy

% constraints on u
IntCon = 1:Nu;
lb = repelem([0],Nu);
ub = repelem([6],Nu);

% function to optimize
fun = @(u)pred_expected_cost1(u,x,t_now,Ny,Nu); 

% Empty constraints
A = [];
b = [];
Aeq = [];
beq = [];
nonlcon = [];

% optimising u with genetic algorithm
[u,J] = ga(fun,Nu,A,b,Aeq,beq,lb,ub,nonlcon,IntCon);
u_star = u(1);

end