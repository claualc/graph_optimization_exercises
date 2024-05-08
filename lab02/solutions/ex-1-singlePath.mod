#-----------------
# parameters
#-----------------
# Number and set of nodes
param n; 
set N := 1..n;
#Set of arcs
set A within N cross N;

param c{A};   # Arc cost
param u{A} ;  # Arc capacitiy

# Number and set of demands 
param n_d; 
set K := 1..n_d;

param s {K} within N; # Source
param t {K} within N; # Destination
param d {K}; # Flow demand

param demand_balance {i in N,k in K} := if i = t[k] then -1 
			else ( if i = s[k] then  1 else 0 );


# arc based formulation: binary case

 var x{A,K} >=0, binary;
 
 
 minimize cost:
 	sum{(i,j) in A, k in K} c[i,j]*d[k]*x[i,j,k];
  	
 s.t. Capacity{(i,j) in A}:
 	sum{k in K} d[k]*x[i,j,k] <= u[i,j];

 	
 s.t. DemandRouting {i in N, k in K}: 
     sum {(i,j) in A} x[i,j,k] - sum {(j,i) in A} x[j,i,k] = 
     			demand_balance[i,k];
     			