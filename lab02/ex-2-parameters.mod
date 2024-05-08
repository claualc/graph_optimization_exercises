#-----------------
# parameters
#-----------------
# Number and set of nodes
param n; 
set N := 1..n;
set A within N cross N;

param f{A};   # Arc installation cost
param u{A} ;  # Arc capacitiy

# Number and set of demands 
param n_d; 
set K := 1..n_d;

param s {K} within N; # Source
param t {K} within N; # Destination
param d {K}; # Flow demand