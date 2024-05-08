
set nodes := 1..N;

#### restricted master problem
#cluster composition
param S default N; 
param a{1..N,1..S} default 0;

var alfa_s{1..S} >= 0; # if cluster i is served by bin

minimize BinOpenMRP: 
	sum{clus in 1..S} alfa_s[clus];

s.t. allNodeSelected {n in nodes}: 
	sum{clus in 1..S} a[n,clus]*alfa_s[clus] >= 1; 

problem master:alfa_s, BinOpenMRP, allNodeSelected; 

#### pricing problem
param pi{nodes} >= 0 default 0; # this is the dual
var u{nodes}, binary; # new cluster to add

maximize Clusters:
	sum{i in nodes} pi[i]*u[i];
	
s.t. capcityPP :
	sum{n in nodes} w[n]*u[n] <= B;
	
problem pricing: u, Clusters, capcityPP;