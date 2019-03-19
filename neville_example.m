% Program to interpolate using Neville's interpolation

clear;

% Data 

% Example 1
% x = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0];
% y = [1.62, 1.00, 0.75, 0.62, 0.52, 0.46];
% Example 2 
x = [7.7, 8.0, 8.3, 8.6, 8.9,9.2, 9.5, 9.8,10.1];
y = [12.82,15.94, 17.56, 18.21, 18.52,18.64, 18.76, 18.81, 18.84];
% Example 3 
% x = [0, 0.8, 1.9, 3.1, 4.2, 5];
% y = [1, 1, 1, 2, 2, 2];

% Number of given values
n = length(x);

% Calculating the values in a loop
for x0 = x(1):0.1:x(end)

    % Using the Neville's interpolation method
    % res - Neville's iterations table
    res = neville_interpolation(x, y, x0); 

    % Plotting the results
    figure(1)
    plot(x,y,'-b')
    hold on;
    grid on;
    plot(x0,res(n,n),'xr')

end