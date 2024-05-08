var x{P} >= 0;

minimize RouteFlow: sum{p in P} cp[p]*x[p];
s.t. PathBalance {k in K}: 
	sum{p in P: s[k] = orig[p] and t[k]=dest[p]} x[p] = d[k];
s.t. PathCapacity {(i,j) in A}: 
	sum{p in P: (i,j) in Path[p]} x[p] <= u[i,j];

