
model C:\Users\claud\Desktop\graph_optimization\lab05\ex5.1-parameters.mod;

var s{A,T}, binary; # service matrix

minimize BSInstalled: sum{b in A, t in T} s[b,t];

s.t. CoverageCons {t in T, b in A}:
	s[b,t] <= coverage[b,t];

s.t. AllServervedCons {t in T}:
	sum{b in A} coverage[b,t]*s[b,t]>=1;