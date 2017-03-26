-module (ccharcount1).
-export ([load/1,count/3,go/1,join/2,split/2]).

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
	logger('Split'),	
	Result=countsplit(Sl,[]),								%
	logger('End'),											%
	Result.	
 
countsplit([],R)->R;
countsplit([H|T],R)->
 %Ul=shake:sort(Sl),
 Result=go(H),
 R2=join(R,Result),
 countsplit(T,R2).

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

go(L)->
Alph=[$a,$b,$c,$d,$e,$f,$g,$h,$i,$j,$k,$l,$m,$n,$o,$p,$q,$r,$s,$t,$u,$v,$w,$x,$y,$z],
rgo(Alph,L,[]).

rgo([H|T],L,Result)->
N=count(H,L,0),
Result2=Result++[{[H],N}],
rgo(T,L,Result2);

rgo([],L,Result)->Result.

logger(Message)->
	io:fwrite("~w ", [nowtime()]),
	io:fwrite("~w ", [Message]),
	io:fwrite("~n").

nowtime()->
	[date(), time()].
