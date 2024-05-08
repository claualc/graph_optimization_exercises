
# STP
param g {A} default 1;

var z{A} >= 0; #if the  arc ij is in the shortest path

minimize ShortestPath: sum{(i,j) in A} g[i,j]*z[i,j];
s.t. PricingFlowBalance {i in N}:
	sum{(i,j) in A} z[i,j] - sum{(j,i) in A} z[j,i] =( 
		if i=source then 1 else (if i=target then -1 else 0)
	);