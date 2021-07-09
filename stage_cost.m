function l = stage_cost(u, x, d, t)
% predicts costs for the end of the next week based on current end of week
% stock (x), current end of week sotck update (u), next weeks demand (d)
% and the upcoming end of week number (t)

if (x+u-d>0) && (t<52)
    warehouse=5;
else
    warehouse=0;
end
    
if (x+u-d<0) && (t<53)
    penalty=20;
else
    penalty=0;
end
    
if (t>51) && (x+u-d>0)
   returns=10*(x+u-d);
else
   returns=0;
end
        
l = warehouse + penalty + returns;
    
end