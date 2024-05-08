var x {P} >= 0;

minimize PathCost:
	sum {p in P} cp[p]*x[p];

s.t. PathBalance {k in K}: 
	sum {p in P: orig[p] = s[k] and dest[p] = t[k]} x[p] = d[k];
	
s.t. PathCapacity {(i,j) in A}: 
     sum {p in P: (i,j) in Path[p]} x[p] <= u[i,j];
     
     
