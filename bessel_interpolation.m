% Program to interpolate using Bessel's interpolation 
  
clear()
format short;
% Number of values given 
n = 6; 
x = [25, 26, 27, 28, 29, 30]; 
  
% y[][] is used for difference  table with y[][1] used for input 
y(1,1) = 4.000; 
y(2,1) = 3.846; 
y(3,1) = 3.704; 
y(4,1) = 3.571; 
y(5,1) = 3.448; 
y(6,1) = 3.333; 

% Calculating the central difference table 
for i = 2:n+1
    for j = 1:(n+1- i)
        y(j,i) = y(j+1,i-1) - y(j,i-1);
    end
end
  
% Displaying the central  difference table 
disp('Central difference table');
disp(y);
  
plot(x,y(:,1));
hold on;

% value to interpolate at 

value = 27.4; 
  
% Initializing u and sum 
for i = 1:n
    if x(i) > value
        sum = (y(i-1,1) + y(i,1)) / 2; 
        u = i;
        break;
    end
end
  
% k is origin that is f(0) 
if (rem(n,2) > 0) %  for odd 
    k = (n/2); 
else 
    k = (n/2)-1; %  for even 
end
u = (value - x(k+1)) / (x(2) - x(1)); 

% Solving using bessel's formula 
for i = 1:n+1
    if rem(i,2)==1
        sum = sum + ((u-0.5) * bessel_vmul(u,i-1) * y(k+1,i+1)) / bessel_fact(i); 
    else
        if k == 0 
            break;
        end
        sum = sum + (bessel_vmul(u,i-1) * (y(k+1,i+1) +  y(k,i+1)) / (bessel_fact(i))*2); 
        k = k-1; 
    end
end
disp('Value');
disp(value);
disp('Sum');
disp(sum); 

plot(value,sum,'*');
hold on;

