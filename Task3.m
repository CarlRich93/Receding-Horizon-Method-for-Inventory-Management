r = 3; % optimal threshold from previous coursework
T=52; % number of weeks shop is open

% Horizons
 Ny_set = [5,5,5,10,10,10,15,15,15,20,20,20];
 Nu_set = [1,3,5, 3, 6, 9, 5,10,15, 6,12,18];
 fprintf('%d', length(Ny_set));
 fprintf('%d', length(Nu_set));
 
 rng('default');
% use same set of simulated demands to provide true comparison
 d = zeros(1,52);
 for i = 1:52
     d(i) = sample();
 end
 
  % use same set of predicted demands to provide true comparison (max Ny=20)
 d_pred = zeros(1,52+20);
 for i = 1:72
     d_pred(i) = sample();
 end
 
 total_costs = zeros(1,length(Ny_set));
for i = 1:length(total_costs)
    Ny = Ny_set(i);
    Nu = Nu_set(i);
    [~, ~, ~, ~, total_cost] = RHM3(Ny,Nu,r,T,d,d_pred);
    total_costs(i) = total_cost(1);
    fprintf('\n************ %d *************\n',i);
end 

figure(1);
scatter([1,3,5],total_costs(1:3),'*');
hold on
scatter([3,6,9],total_costs(4:6),'*');
scatter([5,10,15],total_costs(7:9),'*');
scatter([6,12,18],total_costs(10:12),'*');
legend('Ny=5', 'Ny=10', 'Ny=15', 'Ny=20');
xlabel('Nu');
ylabel('Total Cost');
%print('2d_TC','-dpng');
hold off