
-module (week3).	 		% Module Name
-export ([nowtime/0]).	
-export ([main/0]).			% header function call erlpi:main()
-export ([pierlfunc/0]).	% function declaration (for fun!)
-export ([piest/4]).		% function declaration (coursework)
							% N = loop
							% S = sign
							% D = denominator
							% E = estimate

pierlfunc() -> io_lib:format("~.5f", [math:pi()]). 

main() -> piest(1,-1,3,1).
							% Why 100000? Good question glad you asked. 
							% algorithm is  1 = 1/3; 2 = 1/5; 3 = 1/7
							% 1/10 = 0.1; @ 1/100 = 0.01 = 1/1000 = 0.001
							% 1/10000 = 0.0001; 1/100000 = 0.00001 (5 decimal places).
							
piest(100000,S,D,E) ->		% terminator
P=4*(E),
io_lib:format("~.5f",[P]),
io:fwrite("~n"),
io:fwrite("~w ", [P]);

piest(N,S,D,E) ->
io:fwrite("~w ", [N]),
io:fwrite("~w ", [S]),
io:fwrite("~w ", [D]),
io:fwrite("~w ", [4*E]),
io:fwrite("~n"),
if 
	S >= 0 -> piest(N+1,S*-1, D+2, E+(1/D));
	S < 0 -> piest(N+1,S*-1, D+2, E-(1/D))
end.

nowtime()->
	[date(), time()].


