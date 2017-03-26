-module (pi).
-export ([pi/3]).



pi() -> 4 * pi(0,1,1). 
% T = 0 is the initial estimation 
% M = 1 is the sign 
% D = 1 initial value of the term's index in the Taylor serie 
pi(T,M,D) -> 
A = 1 / D, 
% evaluate the term value 
if 
	A > 0.00001 -> pi(T+(M*A), M*-1, D+2); 
% if the precision is not reach call the pi function with, 
% new serie's evaluation (the previous one + sign * term): T+(M*A) 
% new inverted sign: M*-1
 % new index: D+2 
true -> T 
% if the precision is reached, give the result T end. 
end.