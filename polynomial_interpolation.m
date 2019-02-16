clear()
% Points 
n = 6; % number of points
y = randi([-50,50],n,1);
x = [-2:2:(2*n-4)]';
% Vandermonde matrix
A = zeros(n,n);
A(:,1) = ones(n,1);
for i = 2:n
    A(:,i)=A(:,i-1).*x;
end
a=A\y;
% Range
b=x(1);
c=x(n);
x1=[b-1:0.01:c+1];
% Polynomial equation
y1 = 0;
for i = 1:n
    y1 = y1 + a(i)*x1.^(i-1);
end
% Plot
plot(x,y,'x');
hold on;
plot(x1,y1); 
grid on;
xlabel('x')
ylabel('y')
