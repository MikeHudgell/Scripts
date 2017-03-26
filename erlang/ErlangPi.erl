
-module (ErlPi).	

-export ([PiErlFunc/1]).	
-export ([PiEstFixed5/1]).	

PiErlFunc(Anything) -> Anything.

PiEstFixed5(5) -> jjj;
PiEsPiEstFixed5tVar(N)
-> io:fwrite("~3.3.0w ", [N]),
PiEstFixed5(N+1).