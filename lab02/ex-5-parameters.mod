#-----------------
# parameters
#-----------------
# Number and set of nodes
param n; 
set N := 1..n;
set A within N cross N;

param f{A};     # Arc installation cost
param lambda ;  # Arc capacity

# Number and set of demands 
param n_d; 
set K := 1..n_d;

param s {K} within N; # Source
param t {K} within N; # Destination
param d {K}; # Flow 

param delta;# number of types of devices		
set H := 1..delta; # set of devices;
param u{H}; #capacity of a device of type h
param g{H}; #cost of device of type h