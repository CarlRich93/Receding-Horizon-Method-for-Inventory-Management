function J = pred_expected_cost3(u,x,t_now,Ny,Nu,d)
% predict the total expected cost for prediction horizon Ny
% x = current end of week stock;
% u = vector of future stock updates to be optimized (len Nu)
% t_now = number of week just finished
% Ny = prediction horizon; Nu = control horizon

u_hat = zeros(1,t_now+Ny);
u_hat(t_now+1:t_now+Nu) = u;
u_hat(t_now+1+Nu:t_now+Ny) = repelem([u(Nu)],Ny-Nu); 

 J = 0;
 for t = (t_now+1):(t_now+Ny)
     J = J + expected_cost(u_hat(t), x, t);
     x = x + u_hat(t) - d(t);
 end
end