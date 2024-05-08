param n;
set I:= 1..n;


param p{I};

param w{I};

param B;

var x{I}, binary;

maximize profit: sum{i in I} p[i]*x[i];

s.t. capacity: sum{i in I} w[i]*x[i] <=B;

