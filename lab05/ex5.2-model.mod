model C:\Users\claud\Desktop\graph_optimization\lab05\ex5.2-parameters.mod;

var x{1..N,1..N} >= 0, integer; #amount traffic from i to J

var r{1..N}, binary; # edge j is being used or not
# help variable to allow the counting 

set nodes := 1..N;
minimize edgeNodes:
	sum{e in nodes} r[e];
	
s.t. CountingEdgeNodesOpen {e in nodes}:
	r[e] <= sum{t in nodes} x[t,e];

s.t. CountingEdgeNodesOpenn {e in nodes}:
	r[e] >= (sum{t in nodes} x[t,e])/100000;
	
s.t. capacity {e in nodes}:
	sum{t in nodes} x[t,e] <= B*r[e];

s.t. assigment {t in nodes}:
	sum{e in nodes} x[t,e] = w[t];