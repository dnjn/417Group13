
% Calculate metric to quantify bursting
% This evaluates for entire set (choose spike ranges appropriately if you want to limit set)

X = [1400 1500 2000]; % Array of spike times CHANGE THIS VALUE

n = length(X)-1;
avg = 0;
for i = 1:n
    avg = avg + (X(i+1)-X(i));
end
avg = avg/n;

avg2 = 0;
for i = 1:(n-1)
    avg2 = avg2 + (X(i+2)-X(i));
end
avg2 = avg2/(n-1);

var_1_interval = 0;
for i = 1:n
    var_1_interval = var_1_interval + ((X(i+1)-X(i))-avg)^2;
end
var_1_interval = var_1_interval/n;

var_2_intervals = 0;
for i = 1:(n-1)
    var_2_intervals = var_2_intervals + ((X(i+2)-X(i))-avg2)^2;
end
var_2_intervals = var_2_intervals/(n-1);

B = (2*var_1_interval-var_2_intervals)/(2*avg^2);

if B < 0.15
    disp(['B = ',num2str(B)]);
    disp('Not a bursting interval');
else
    disp(['B = ',num2str(B)]);
    disp('Bursting interval');
end