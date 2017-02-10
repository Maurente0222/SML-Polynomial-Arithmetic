/****************************
Author: Maximiliano Maurente
USF COP 4020 Programming Languages

*****************************/

This project is coded in Standard ML

The functions in xy2.sml all manipulate 2 variable (call them X and Y) polynomials, which are passed as "list of list"'s... 
    Each element in the "list list" represents a coefficient. The index of the coefficient within the inner list represents the X^th degree by which the coeffient is multiplied, starting from 0  on the left. 
    The index of the element's current list, within the list of lists, represents the Y^th degree by which the coeffient is multiplied, starting from 0 with the first list on the left. 
    An example:
    [ [1,0,2][3,1]... ] -> 1(x^0)(y^0) + 2(x^2)(y^0) + 3(x^0)(y^1) + 1(x^1)(y^1)...

In EvalXY I apply Horner's rule for polynomial evaluation, which can be found at:
	https://rosettacode.org/wiki/Horner%27s_rule_for_polynomial_evaluation#Standard_ML

