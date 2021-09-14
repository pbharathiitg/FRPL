function z = zvec(t,n)
    z = zeros(n+1,1);
    h = sum(t);
    z(1) = (h/2);
    for i = 2:n+1
        z(i) = z(i-1) - t(i-1);
    end
end