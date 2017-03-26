-module (week3a).
-export ([myloop/3,rec/2,worker/1,go/0]).



%	
%
% Process is client.
%-
go() ->
	logger('set up collector'),
	CollectPid = spawn(week3a, rec, [self(), ['a']]),
	receive
		{From, Msg} -> 
			logger(Msg);
			_Other -> {error, unknown}
	end.
%	
%
% Process is Collector.
%
rec(ClientPid, Rtn) -> 
	timer:sleep(5000),
	myloop(1, ClientPid, Rtn),
	ClientPid ! {self(), ['Collector Finishing', Rtn]}.

	
	
%	
%
% Process is Collector.
%
myloop(2, _, Rtn) -> 'OK';								% terminator
myloop(N, ClientPid, Rtn) -> 									% set up workers
	WPid = spawn(week3a,worker,[self()]),		% give collector my process id
	receive
		{From, Msg} -> 
			Rtn++Msg,
			ClientPid ! {self(), [Rtn]};
			_Other -> {error, unknown}
	end,
	myloop(N+1, ClientPid, Rtn).
%	
%
% Process is Worker.
%
worker(CollectPid) -> 
	timer:sleep(5000),
	CollectPid ! {self(), ['Worker Finishing']}.
	


logger(Message)->
	io:fwrite("~w ", [nowtime()]),
	io:fwrite("~w ", [Message]),
	io:fwrite("~n").

nowtime()->
	[date(), time()].