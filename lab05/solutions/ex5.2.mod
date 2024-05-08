#
#VARIABLES

#terminal nodes to edge nodes assignment 
var x{1..N,1..N} binary;

#edge node selection
var y{1..N} binary;


#OBJECTIVE

#minimize number of used edge nodes
minimize edgeNodes: sum{j in 1..N} y[j];


#CONSTRAINTS

#assignment constraints
subject to assignment{i in 1..N}:  sum{j in 1..N} x[i,j] = 1;

#capacity constraints
subject to capacity{j in 1..N}:
	sum{i in 1..N} w[i]*x[i,j] <= B*y[j];#terminal nodes to edge nodes assignment
	