set nodes := 1..N;

var x{nodes,nodes} > 0; # node i served by bin j 
var y{nodes} > 0;   # bin j is open or not

minimize OpenBins: 
	sum{i in nodes} y[i];
	
s.t. assigment {j in nodes}:
	sum{i in nodes} x[i,j] = 1;
	
s.t. capacity {i in nodes}:
	sum{j in nodes} x[i,j]*w[j] <= B*y[i];