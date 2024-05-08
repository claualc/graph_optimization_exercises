

var y{A} binary;

minimize baseStationsNumber: sum{i in A} y[i];

s.t. covering{j in T}: sum{i in A} coverage[i,j]*y[i] >= 1;