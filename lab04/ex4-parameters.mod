#-----------------
# parameters
#-----------------
# Number of nodes
param n; 
set N := 1..n;
set A within N cross N;

param c{A};   # Arc cost
param u{A} ;  # Arc capacitiy

# Number and set of commodities 
# variables of the master problem
param n_d; 
set K := 1..n_d;

param s {K} symbolic in N; # Source
param t {K} symbolic in N; # Destination
param d {K}; # Flow demand

# Number and set of paths
# variables of the pricing problem
param n_p; 
set P := 1..n_p;
set Path {P} within N cross N;

param orig{P} symbolic in N;  # Origin
param dest{P} symbolic in N;  # Destination
param cp {P};  # Cost

param source symbolic in N;
param target symbolic in N;
