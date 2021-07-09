r = 3; % optimal threshold from previous coursework
T=52; % number of weeks shop is open
Ny = 5; % prediction horizon
Nu = 5; % control horizon
weeks = 0:T; % for plots

rng('default');
total_costs = zeros(1,100);
for i = 1:length(total_costs)
    [u_evol, x_evol, J_evol, cost_evol, total_cost] = RHM1(Ny,Nu,r,T);
    total_costs(i) = total_cost(1);
    fprintf('\n************ %d *************\n',i);
end    

% plot histogram of total costs for horizon (5,5)
figure(1);
histogram(total_costs, 8);
xlabel('Total Cost');
%print('Hist_55','-dpng')
fprintf('Mean of total cost was %f and standard deviation was %f', mean(total_costs), std(total_costs));

% plot stock level and stock update evolution for last trial
figure(2);
plot(weeks, x_evol);
hold on
plot(weeks, u_evol);
xlabel('Weeks');
axis([0 T 0 6]);
legend('Stock level', 'Stock update');
%print('SU_55','-dpng')
hold off

% plot cost evolution for last trial
figure(3);
plot(weeks, cost_evol);
title('Weekly Cost');
xlabel('Weeks');
ylabel('Cost');
axis([0 T 0 30]);

% plot predicted cost evolution for last trial
figure(4);
plot(weeks, J_evol);
title(['Weekly Predicted Cost for a horizon of ', num2str(Ny)]);
xlabel('Weeks');
ylabel('Cost');
axis([0 T 0 50]);