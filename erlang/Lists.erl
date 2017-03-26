
-module (lists).	 		% Module Name
-export ([sort/1]).			% function declaration 

sort([Pivot|T]) ->
	sort([X||X <- T,X < Pivot])++
	[Pivot]++
	sort([X||X <- T,X >= Pivot]);
sort([]) -> [].
