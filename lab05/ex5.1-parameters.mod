param n; # number of candidate sites
param m; # number of test points

set A := 1..n;
set T := 1..m;

param coverage{A,T}; # matrix m