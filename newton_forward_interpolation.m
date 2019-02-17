clear()
% Points 
n = 6; % number of points
y = randi([-50,50],n,1);
x = [-2:2:(2*n-4)]';
syms t y1 b;
% % Newton interpolation
% forward differences
a = zeros(n,n);
a(:,1) = y;
for j = 2:n
	for i = j:n
		a(i,j) = a(i,j-1) - a(i-1,j-1);
	end
end
% diagonal
d = diag(a);
% product
s = (t-x(1))/(x(2)-x(1));
b = [1 s];
for i = 3:1:n
	b(i) = b(i-1)*(s-(i-2))/(i-1);
end
y1 = simplify(b*d);
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
