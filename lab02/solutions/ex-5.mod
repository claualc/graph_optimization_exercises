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

param delta;# number of types of devices		
set H := 1..delta; # set of node devices;
param u{H}; #capacity of device h in H
param g{H}; #cost of device h in H

param demand_balance {i in N,k in K} := if i = t[k] then -1 
			else ( if i = s[k] then  1 else 0 );
	
 var x{A,K} binary;
 var y{A} integer;
 var z{N,H} binary; #device selection
 
 
 minimize cost:
 	sum{(i,j) in A, k in K} f[i,j]*y[i,j] 
 			+ sum{i in N, h in H}g[h]*z[i,h];
  	
 s.t. Capacity{(i,j) in A}:
 	sum{k in K} d[k]*x[i,j,k] <= lambda*y[i,j];

 	
 s.t. DemandRouting {i in N, k in K}: 
     sum {(i,j) in A} x[i,j,k] - sum {(j,i) in A} x[j,i,k] = 
     			demand_balance[i,k];
     			
s.t. NodeDimensioning{i in N}:
		sum{j in N: (j,i) in A}(sum{k in K} d[k]*x[j,i,k]) <= sum{h in H} u[h]*z[i,h];
		
s.t. SingleDevice{i in N}:
		sum{h in H} z[i,h] <= 1;
     			
     		