function result = HollingTypeTwo(x, attackRate, b)
    a =  attackRate;
    result = a .* x./(b + x);
end