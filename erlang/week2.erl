% Student:		Mike Hudgell
% Student ID:	(140000254)
% Date: 		20 March 2014
% Notes: 		Just call main([list of stuff]), sorry old habits and all that.

-module (week2).	 		% Module Name

-export ([sort/1]).			% function declaration 1 parameter list expected.
-export ([nodups/1]).		% function declaration 1 parameter list expected.
-export ([test/1]).
-export ([each/1]).
-export ([lcount/2]).
-export ([main/1]).

%-----------------------------------------------------------------------------
% Assignment dedupe list and count.
%-----------------------------------------------------------------------------
main([H|T]) -> M1 = nodups([H|T]),
	io:fwrite("~w ",[M1]),
	lcount(M1,0);
main([])->[].

nodups([Pivot_H|T]) ->
	nodups([X||X <- T,X < Pivot_H])++
	[Pivot_H]++
	nodups([X||X <- T,X > Pivot_H]);	% anything equal to head is dropped.
nodups([]) -> [].

lcount([H|T],C) ->
	lcount(T, C+1);
lcount([], C)->io:fwrite("~w ",[C]).


%-----------------------------------------------------------------------------
% This was just for fun
%-----------------------------------------------------------------------------
sort([Pivot_H|T]) ->
	sort([X||X <- T,X < Pivot_H])++
	[Pivot_H]++
	sort([X||X <- T,X >= Pivot_H]);
sort([]) -> [].

test([Pivot_H|T]) -> lists:usort([Pivot_H|T]).

each([H|T]) ->
	io:fwrite("~w ",[H]),
	each(T);
each([])->[].


