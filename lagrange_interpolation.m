clear()
% Points 
n = 6; % number of points
y = randi([-50,50],n,1);
x = [-2:2:(2*n-4)]';
syms t;
% Lagrange interpolation
y1 = 0;
for i = 1:n
	a = 1;
	for j = 1:n
		if (i ~= j)
			a = a*((t-x(j))/(x(i)- x(j)));
		end
	end
	y1 = y1 + y(i)*a;
end
y1 = simplify(y1);
% Range
t = x(1):0.01:x(end);
y1 = eval(y1);
% Plot
plot(x,y,'x');
hold on;
plot(t,y1); 
grid on;
xlabel('x')
ylabel('y')
