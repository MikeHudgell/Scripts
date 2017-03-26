% Student:		Mike Hudgell
% Student ID:	(140000254)
% Date: 		20 March 2014
% Notes: 		Not extensively tested, only with Hamlet and War text files. Call load(file.ext).

-module (week3).
-export ([load/1,count/3,go/2,rgo/3,join/2,split/2, merger/3]).

load(F)->
	logger('Start'),
	{ok, Bin} = file:read_file(F),							
	List=binary_to_list(Bin),								
	Length=round(length(List)/20),							
	Ls=string:to_lower(List),								
	logger('Loaded'),										
	Sl=split(Ls,Length),									
	MergePid = spawn(weekx, merger, [self(), 21, []]),		% spawn process to receive and merge results
	logger('Merge Process Created'),
	logger(MergePid),
	Result=countsplit(Sl,[],MergePid),						% pass merge process pid to workers so they can forward results
	logger('split'),
	logger('waiting'),
	io:fwrite("~n"),
	receive
		{From,FinalResult} -> 
			io:fwrite("~w ", [From]),
			io:fwrite("~w~n", [FinalResult]),
			io:fwrite("~w ", [nowtime()]);
		_Other -> {error, unknown}
	end.													

countsplit([],R,_)->R;										
countsplit([H|T],R, MergePid)->													
	Pid = spawn(week3, go, [H, MergePid]),				% worker processes to do the counting
%	logger(Pid),
%	receive
%		{From,Msg} -> 
%			MergePid ! {self(), Msg};				% send result to merge process to merge.
%		_Other -> {error, unknown}
%	end,
	countsplit(T,R,MergePid).

join([],[])->[];											
join([],R)->R;												
join([H1 |T1],[H2|T2])->									
	{C,N}=H1,												
	{C1,N1}=H2,
	[{C1,N+N1}]++join(T1,T2).								
															
split([],_)->[];											
split(List,Length)->										
	S1=string:substr(List,1,Length),														
	case length(List) > Length of							
		true->S2=string:substr(List,Length+1,length(List));	
		false->S2=[]										
	end,													
	[S1]++split(S2,Length).									

															
count(Ch, [],N)->N;											
count(Ch, [H|T],N) ->																		
	case Ch==H of											
		true-> count(Ch,T,N+1);								
		false -> count(Ch,T,N)								
	end.													 

go(L, Pid)->	
	Alph=[$a,$b,$c,$d,$e,$f,$g,$h,$i,$j,$k,$l,$m,$n,$o,$p,$q,$r,$s,$t,$u,$v,$w,$x,$y,$z], 	
	Result = rgo(Alph,L,[]),
	Pid ! {self(), Result}.
															
rgo([H|T],L,Result)->										
	N=count(H,L,0),											
	Result2=Result++[{[H],N}],								 
	rgo(T,L,Result2);										
rgo([],L,Result)-> Result,									 
	Result.													
	
logger(Message)->
	io:fwrite("~w ", [nowtime()]),
	io:fwrite("~w ", [Message]),
	io:fwrite("~n").

nowtime()->
	[date(), time()].

merger(ClientPid, 0, CumRes) ->						% all workers have completed
	ClientPid ! {self(), CumRes};
merger(ClientPid, NumProcesses, CumRes) ->				% loop round receiving results and merging
	receive
		{WorkerPid, Result} ->
			R3 = join(CumRes,Result),
			R4 = merger(ClientPid, NumProcesses-1, R3) 
	end.

