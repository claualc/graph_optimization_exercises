
param n_I; # number of candidate sites

param n_J; # number of test points 

set I := 1..n_I; #set of candidate sites
set J:= 1..n_J; # set of test points


param p;

param d{j in J, i in I}; # assignment cost test points->antenna


