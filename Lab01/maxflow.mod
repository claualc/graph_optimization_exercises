# max flow model

set Nodes;

set Arcs within {i in Nodes, j in Nodes};

param s symbolic in Nodes;

param t symbolic in Nodes;

param cap{Arcs} >= 0;

var x{Arcs} >= 0 ;

var v >= 0;

maximize flow:
		v;

subject to balancing{i in Nodes}:
	sum{j in Nodes : (i,j) in Arcs} x[i,j] - 
	sum{k in Nodes : (k,i) in Arcs} x[k,i] = 
			(if i = s
				then v
				else (if i = t then -v
				else 0));

subject to capacity{(i,j) in Arcs}:
		x[i,j] <= cap[i,j];

