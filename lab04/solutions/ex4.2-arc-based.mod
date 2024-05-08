# arc based formulation

param demand_balance {i in N,k in K} := 
		if i = t[k] then d[k] else ( if i = s[k] then - d[k] else 0 );


 var y{A,K} >=0;
 var w{A} >=0;
 
 minimize arcBasedCost:
 	sum{(i,j) in A, k in K} c[i,j]*y[i,j,k];
 
minimize arcCapacity: sum{(i,j) in A} w[i,j];
 	
 s.t. Capacity{(i,j) in A}:
 	sum{k in K} y[i,j,k] <= u[i,j];
 	
  s.t. arcDimensioning{(i,j) in A}:
 	sum{k in K} y[i,j,k] <= w[i,j];
 	
 s.t. DemandRouting {i in N, k in K}: 
     sum {(j,i) in A} y[j,i,k] - sum {(i,j) in A} y[i,j,k] = demand_balance[i,k];