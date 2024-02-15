function result = HollingTypeTwo(x, attackRate, b)
    a =  attackRate;
    result = a .* x./(1 + a.*b.*x);
end