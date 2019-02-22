% calculating u mentioned in the  formula 
function temp = bessel_vmul(u, n)
    temp = u; 
    if n >= 1
        for i = 1:(n/2) 
            temp = temp * (u - i); 
        end
        for i = 1:(n/2-1)
            temp = temp * (u + i); 
        end
    else 
        temp = 1;
    end
end