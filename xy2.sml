(*Application of Horner's rule.. Helper function to evalXY. Evaluates
	each sublist at the value of X*)
fun evalX xCoef x = foldr (fn (a,b) => a + b*x) 0 xCoef
(*  Evaluates by recursivle calling foldr, which calls evalX*)
fun evalXY lCoef x y = evalX (map (fn xCoef:(int list) => evalX xCoef x)
							      lCoef
							 )
							 y

(*s is for scalar. *)
(*Map performs a scalar multiplication on eack term in the 
    coefficient list*)
fun multXY nil s = nil
|	multXY lCoef 0 = nil
|	multXY lCoef 1 = lCoef
|	multXY lCoef s = 
	map (fn xCoef:(int list) => map (fn c:int => c*s) xCoef) lCoef

(*Was not able to complete. This is a helper function to help
	fun addXY add each sublist.*)
fun padd P nil = P
|	padd nil Q = Q
|	padd ((p:int)::ps) (q::qs) = (p+q)::padd ps qs
(*Each sublist is appended to the list list*)
fun addXY nil nil = nil
|	addXY nil l2 = l2
|	addXY l1 nil = l1
|	addXY (p::ps) (q::qs) = (padd p q)::(addXY ps qs)
