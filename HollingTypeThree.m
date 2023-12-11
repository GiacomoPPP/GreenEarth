function result = HollingTypeThree(x, attackRate, theta, nu)
    a =  attackRate;
    t = theta;
    n = nu;
    result = a .* (x.^t)./(n.^t + x^t);
end