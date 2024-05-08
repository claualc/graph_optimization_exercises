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

param s{K} symbolic in N; # Source
param t{K} symbolic in N; # Destination
param d{K}; # Flow demand

# flow per arch
var x{A,K} >= 0, integer; # it is not splitable, all the flow should go through the arcs

# objective funtion
minimize FLowCost: sum{(i,j) in A, k in K} c[i,j]*x[i,j,k];

#constrains
 s.t. Capacity{(i,j)in A}:
	sum{k in K} x[i,j,k] <= u[i,j];
	
 s.t. Solenoidality{i in N, k in K}:
	sum {(i,j) in A} x[i,j,k] - sum {(j,i) in A} x[j,i,k]= (if i = t[k] then -d[k] 
			else ( if i = s[k] then  d[k] else 0 ));

