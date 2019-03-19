function q = neville_interpolation (x, y, x0) 

    % Initialization
    n = length(x);
    q = zeros(n, n);
    q(:,1) = y;
    
    % Neville's equation
    for i = 2:n 
        for j = i:n
            q(j,i) = ((x0-x(j-i+1))*q(j,i-1)-(x0-x(j))*q(j-1,i-1))/(x(j)-x(j-i+1));
        end
    end
  
end