val l = [0,~2,0,0,3];
val l2 =[1,3,~5];
val L = [[1], [0,~2,0,0,3], [], [], [], [], [~5,0,7]];
val L2 = [[], [3,4,5,~6], [], [], []]


(*Prints a list*)
fun prlst nil n = ()
|   prlst (x::xs) n = 
    ( 
        if (n = 0)
        then 
        (
        	if(x < 0)
        	then 
        	(
        		print("-");
        		print(Int.toString(~x));
        		print(" + ")
        	)
        	else
        	(
        		print(Int.toString(x));
        		print("y^#");
        		print(" + ")
        	)
        )
        else 
    	(
    		if(x < 0)
        	then 
        	(
        		print("-");
        		print(Int.toString(~x));
        		print("x^");
		    	print(Int.toString(n));
		    	print("y^#");
		    	print(" + ")
        	)
        	else
		    (
		    	print(Int.toString(x));
		    	print("x^");
		    	print(Int.toString(n));
		    	print("y^#");
		    	print(" + ")
		    )
		);
		(*if (xs = nil)
		then 
			print("")
		else
        	print(" + ");*)
        (prlst xs (n+1))
    );
(*Prints a list list*)
fun prlstlst nil = print("\n")
|	prlstlst lCoef = 
	(
		
		(map (fn xCoef:(int list) => (prlst xCoef 0)) lCoef);
		print("\n")
	);


(*Im not understanding how args are passed into anonymous functions in 
	functions like map, that recursively iterate through a list. How do i 
	pass a sublist into the inner function (foldr) each time map evaluates
	at that recursive level??*)
(*fun evalXY lCoeffs x = 
			map 
			(foldr (fn(a, b) => a + b*x) 0 ???)
			lCoeffs

*)

(*Application of Horner's rule.. Helper function to evalXY. Evaluates
	each sublist at the value of X*)
fun evalX xCoef x = foldr (fn (a,b) => a + b*x) 0 xCoef
(* THIS ONE WORKS.. MAP RETS LIST OF ints... FOLDR RET int*)
fun evalXY lCoef x y = evalX (map (fn xCoef:(int list) => evalX xCoef x)
							      lCoef
							 )
							 y
(*DONE*)
(*s is for scalar. *)
fun multXY nil s = nil
|	multXY lCoef 0 = nil
|	multXY lCoef 1 = lCoef
|	multXY lCoef s = 
		map (fn xCoef:(int list) => map (fn c:int => c*s) xCoef)
			lCoef
(*DONE*)


fun padd P nil = P
|	padd nil Q = Q
|	padd ((p:int)::ps) (q::qs) = (p+q)::padd ps qs

fun addXY nil nil = nil
|	addXY nil l2 = l2
|	addXY l1 nil = l1
|	addXY (p::ps) (q::qs) = (padd p q)::(addXY ps qs)



val tEval = evalXY L 2 2; (* evaluate at poly at x y... RETS int*)
val tMult = multXY L 3;
val tAddp = addXY L L2;

prlstlst(tAddp);
(*
prlstlst(tMult);
*)
(*
print(Int.toString(tAddp));
*)