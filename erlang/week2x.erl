% Student:		Mike Hudgell
% Student ID:	(140000254)
% Date: 		20 March 2014
% Notes: 		Just call wordcount(file.ext).
% Problem/Task: Count the frequency of words in a file.
% Solution: Load file; identify words and put in list; sort list; count frequency.
% If you notice inefficient and/or duplicate code, true! Running out of time to complete 
% this so was kind of baselining each part so I could submit an incomplete but working solution...
% 		

-module(week2x).
-export([wordcount/1]).

wordcount(File)->											% public function
	logger('Start',''),
	{ok, Bin} = file:read_file(File),							
	List=binary_to_list(Bin),
	logger('Loaded',''),								
	Length=length(List),
	logger('Number of Characters ', Length),							
	LowerList=string:to_lower(List),						% lowercase it to stop that being an issue						
	WordNum = countwords(LowerList, true, 0),				% 
	logger('Number of Words ',WordNum),	
	WordList = listwords(LowerList, false, [], []),
	logger('Unsorted List of Words ',''),	
	displaywords(WordList),									% displays word list
	Keys = keylist(WordList,[]),
	logger('List of Words with keys ',''),
	logger(Keys,''),
%	sort
%   count
% 	display	
	logger('Complete','').
 
countwords([], WordBreak1, Count) -> Count;					%TERMINATOR: whole list processed.
countwords([H|T], WordBreak1, Count) ->						% wordbreak1 is current character part of a word
	Result = iswordbreak(H),
	if WordBreak1 == true ->								% in a word break already
		if Result == true ->								% still in a word break
			countwords(T, true, Count);	
		true ->	
			countwords(T, false, Count)						% no longer in word break
		end;
	true ->													% else NOT IN WORD BREAK
		if Result == true ->								% just gone into a word break
			countwords(T, true, Count+1);	
		true ->	
			countwords(T, false, Count)						% still in a word
		end
	end.
	
listwords([], WordBreak1,Word, WordList) -> WordList;		%TERMINATOR: whole list processed.
listwords([H|T], WordBreak1, Word, WordList) ->				% wordbreak1 is current character part of a word
%	logger(H,''),
	Result = iswordbreak(H),
	if WordBreak1 == true ->								% in a word break already
		if Result == true ->								% still in a word break
%				logger('break true','result true'),
				listwords(T, true, Word, WordList);	
		true ->	
%			logger('break true','result false'),
			NewWord = addtoword(Word, H),
			listwords(T, false, NewWord, WordList)			% no longer in word break
		end;
	true ->													% else NOT IN WORD BREAK
		if Result == true ->								% just gone into a word break										
%			logger('break false','result true'),
			NewList = addtowordlist(WordList,Word),
			listwords(T, true,[], NewList);	
		true ->	
%			logger('break false','result false'),
			NewWord = addtoword(Word, H),
			listwords(T, false, NewWord, WordList)			% still in a word
		end
	end.
	
addtoword(Word, Letter) -> Word++[Letter].

addtowordlist(List, Word) -> List++[Word].

addtokeylist(List, Word) ->
	ThisKey = createkey(Word, 1,0),
	List++[[ThisKey]++[Word]].

	
createkey([], Count, WordVal) -> WordVal;
createkey([H|T], Count, WordVal) -> 	
	createkey(T,Count+1,WordVal+(H*Count)).


displaywords([]) -> true;
displaywords([H|T]) ->
	io:fwrite([H]),	
	io:fwrite("~n"),
	Result = displaywords(T).

keylist([], KList) -> KList;
keylist([H|T], KList) ->
	NewList = addtokeylist(KList,H),
	keylist(T, NewList).

iswordbreak(32) -> true;									% space
iswordbreak(44) -> true;									% comma
iswordbreak(13) -> true;									% CR
iswordbreak(10) -> true;									% LF
iswordbreak(46) -> true;									% full stop		
iswordbreak(58) -> true;									% colon
iswordbreak(59) -> true;									% semi colon
iswordbreak(C) -> false.												

%
% just the logger; nothing to see here.
%
logger(Message1, '')->
	io:fwrite("~w ", [nowtime()]),
	io:fwrite("~w ", [Message1]),
	io:fwrite("~n");
logger(Message1, Message2)->
	io:fwrite("~w ", [nowtime()]),
	io:fwrite("~w ", [Message1]),
	io:fwrite("~w ", [Message2]),
	io:fwrite("~n").

nowtime()->
	[date(), time()].

