function J = StockCostFcn(X,U,e,data)
p = data.PredictionHorizon;
p_d = [0.04, 0.09, 0.27, 0.4, 0.16, 0.02, 0.02];
warehouse = zeros(p);
penalty =  zeros(p);
returns = zeros(p);

for k in 1:p
    if X(k)>0
        warehouse(k)=5;
    else
        warehouse(k)=0;
    end
    
    if X(k)<0
        penalty(k) = 20;
    else
        penalty(k) = 0;
    end
    
    if k==52
        returns(k) = 10*X(k);
    else
        returns(k) = 0;
    end
end 

J = 

end