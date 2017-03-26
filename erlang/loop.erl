-module (loop).
-export ([mirror/1]).
-export ([count/1]).

mirror(Anything) -> Anything.

count(20) -> jjj;
count(N)
-> io:fwrite("~3.3.0w ", [N]),
count(N+1).