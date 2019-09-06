function fx = fitness(x)
BADFITNESS = inf;
c  = conflicts(x);
r = repetitions(x);
n = sum(x);
if n == 0, fx = BADFITNESS;
else
fx = (n-c) - (c/n);
fx = -fx + 5*r;
end
