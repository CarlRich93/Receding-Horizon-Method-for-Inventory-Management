function l = weekly_cost(x,t)
% compute weekly cost

if (x>0) && (t<52)
    warehouse=5;
else
    warehouse=0;
end
    
if (x<0) && (t<53)
    penalty=20;
else
    penalty=0;
end
    
if (t>51) && (x>0)
    returns=10*x;
else
   returns=0;
end
        
l = warehouse + penalty + returns;    
end
