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
param d {K}; # Flow demand

param demand_balance {i in N,k in K} := if i = t[k] then -2 
			else ( if i = s[k] then  2 else 0 );


 var x{A,K} binary;
 var y{A} integer;
 
 
 minimize cost:
 	sum{(i,j) in A, k in K} f[i,j]*y[i,j];
  	
 s.t. Capacity{(i,j) in A}:
 	sum{k in K} d[k]*x[i,j,k] <= lambda*y[i,j];

 	
 s.t. DemandRouting {i in N, k in K}: 
     sum {(i,j) in A} x[i,j,k] - sum {(j,i) in A} x[j,i,k] = 
     			demand_balance[i,k];
     			
     	