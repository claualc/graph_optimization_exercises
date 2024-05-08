#
#VARIABLES

#item to bin assignment 
var x{1..N,1..N} binary;

#bin selection
var y{1..N} binary;


#OBJECTIVE

#minimize number of used bins
minimize bin: sum{j in 1..N} y[j];


#CONSTRAINTS

#assignment constraints
subject to assignment{i in 1..N}:  sum{j in 1..N} x[i,j] = 1;

#capacity constraints
subject to capacity{j in 1..N}:
	sum{i in 1..N} w[i]*x[i,j] <= B*y[j];#item to bin assignment
	
	
	#CONTINUOUS problem 
var x_CR{1..N,1..N} >=0, <=1;

#bin selection
var y_CR{1..N} >=0, <=1;


#OBJECTIVE

#minimize number of used bins
minimize bin_CR: sum{j in 1..N} y_CR[j];


#CONSTRAINTS

#assignment constraints
subject to assignment_CR{i in 1..N}:  sum{j in 1..N} x_CR[i,j] = 1;

#capacity constraints
subject to capacity_CR{j in 1..N}:
	sum{i in 1..N} w[i]*x_CR[i,j] <= B*y_CR[j];
	
#loose capacity constraints
subject to capacity_CR_2{j in 1..N}:
	sum{i in 1..N} w[i]*x_CR[i,j] <= B;
	
# consistency
subject to consistency_CR{i in 1..N, j in 1..N}:
	x_CR[i,j] <= y_CR[j];
	

	
problem binPacking: x,y, bin, assignment, capacity; 
problem binPacking_CR: x_CR,y_CR, bin_CR, assignment_CR, capacity_CR; 
problem binPacking_CR_2: x_CR,y_CR, bin_CR, assignment_CR, capacity_CR_2, consistency_CR; 
problem binPacking_CR_3: x_CR,y_CR, bin_CR, assignment_CR, capacity_CR, consistency_CR; 

