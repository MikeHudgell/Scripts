-module (week3).
-export ([load/1,count/3,go/2,rgo/3,join/2,split/2]).

load(F)->
	logger('Start'),
	{ok, Bin} = file:read_file(F),							% load file when you see reference to easy.txt this file contained abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
	List=binary_to_list(Bin),								% turn into list
	Length=round(length(List)/20),							% Length is number of characters in the file / 20
	logger(length(List)),									% easy.txt = 52 
	logger(Length),											% easy.txt = 3
	Ls=string:to_lower(List),								% all to lower case
	logger('Loaded'),										%
	Sl=split(Ls,Length),									% S1 = split ( lowercase list, length/20) for easy split(abcdefghijklmnopqrstuvwxyz..., 3)
	Temp={1,2},
	MergePid = spawn(week3, merger, [self(), 20, Temp]),		% spawn process to receive and merge results
	receive
		{From,FinalResult} -> 
			io:fwrite("~w ", [From]),
			io:fwrite("~w~n", [FinalResult]),
			io:fwrite("~w ", [nowtime()]);
		_Other -> {error, unknown}
	end,
	logger(MergePid),
	Result=countsplit(Sl,[],MergePid),								%
	logger('End').											%
%	Result.													% outputs the result.

countsplit([],R,_)->R;										% when list is empty return second parameter?
countsplit([H|T],R, MergePid)->										% head and tail list in, R 
%	logger(H), 												% easy.txt = [97,98,99] H is a list
	Pid = spawn(week3, go, [H, self()]),					% result = go([97,98,99]) Result = [{[97],1},{[98],1},{[99],1},{[100],0}...]
	logger(Pid),
	receive
		{From,Msg} -> 
%			io:fwrite("~w ", [From]),
%			io:fwrite("~w~n", [Msg]),
			MergePid ! [self(), Msg];						% send result to merge process to merge.
		_Other -> {error, unknown}
	end.
		
% Result=go(H),
% R2=join(R,Result),
% countsplit(T,R2).


join([],[])->[];											% when both lists are empty return empty list
join([],R)->R;												% when first list is empty return second list
join([H1 |T1],[H2|T2])->									% 2nd time through remainder of my list [100,101,102],..], with count so far [{[97],1},{[98],1},{[99],1},{[100],0}...]
%	logger('join - '),										% simple way of checking number of calls to function and path of programme
%	logger(H1),												% {[97],1} 
%	logger(H2),												% {[97],0} 
	{C,N}=H1,												% 
	{C1,N1}=H2,
%	logger(T1),												% 
%	logger(T2),		%
	[{C1,N+N1}]++join(T1,T2).								% [{97, 1+0}] append recursive call with tails[{[98],1},{[99],1},{[100],0}...]
															% abcdefghijklmnopqrstuvwxyz, 1 
split([],_)->[];											% empty list in, empty list out, terminator
split(List,Length)->										% everything else
	S1=string:substr(List,1,Length),						% S1 = substring(abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz, 1, 3) east.txt takes 1st 3 chars
%	logger('Split - '),										% simple way of checking number of calls to function and path of programme
%	logger(S1),												% remove this when not dealing with easy.txt!
	case length(List) > Length of							% 52 > 3
		true->S2=string:substr(List,Length+1,length(List));	% S2 = substring(abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz, 4, end of list) east.txt takes remaining characters
		false->S2=[]										% S2 = empty list were done.
	end,													%	
	[S1]++split(S2,Length).									% take S1 ABC and then append recursive S2, 3 = defghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz,3

															% count(97, [97,98,99], 0)  count(A, [A,B,C], 0)  
count(Ch, [],N)->N;											% character, empty list, N return N terminator 
count(Ch, [H|T],N) ->										% (97, [97,98,99], 0)
%	logger('count - '),										% simple way of checking number of calls to function and path of programme
	case Ch==H of											% 97 == 97
		true-> count(Ch,T,N+1);								% recursive count(97, [98,99], 1) Houston we have found an A
		false -> count(Ch,T,N)								% recursive count(97, [98,99], 0) Houston we have found an A
	end.													% 

go(L, Pid)->	
	Alph=[$a,$b,$c,$d,$e,$f,$g,$h,$i,$j,$k,$l,$m,$n,$o,$p,$q,$r,$s,$t,$u,$v,$w,$x,$y,$z], 	
	Result = rgo(Alph,L,[]),
	Pid ! {self(), Result}.
															
rgo([H|T],L,Result)->										% 
	N=count(H,L,0),											%
	Result2=Result++[{[H],N}],								% 
	rgo(T,L,Result2);										% 
rgo([],L,Result)-> Result,									% 
	Result.													% 
	
logger(Message)->
	io:fwrite("~w ", [nowtime()]),
	io:fwrite("~w ", [Message]),
	io:fwrite("~n").

nowtime()->
	[date(), time()].

merger(ClientPid, 2, CumRes) ->	
	ClientPid ! {self(), CumRes};							% return final result to calling routine.
merger(ClientPid, NumProcesses, CumRes) ->					% merge results coming from worker processes.
	receive
		{WorkerPid, Result} ->
			R3 = join(Result, CumRes),
			R4 = merger(ClientPid, NumProcesses-1, R3);
		_Other -> {error, unknown}
	end.
