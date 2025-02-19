-------------------------------- MODULE wgc --------------------------------
\* Define the actors/entities
W == "Wolf"
G == "Goat"
C == "Cabbage"
F == "Farmer"

\* Define set of actors
A == {W, G, C, F}

VARIABLES left

\* INITIAL STATE
Init == (*Everyone starts on the left bank*)
    left = A
    
mvlr == 
    /\ F \in left
    /\ \E a \in left : left' = left \ {F,a}

mvrl ==
    /\ F \in A \ left
    /\ \E a \in A \ left : left' = left \cup {F, a}
    
l0(s) == (*Set s child of A licit on a bank: no conflict*)
    ( { W, G } \subseteq s \/ { G, C } \subseteq s ) => F \in s

l(s) == (*Set s licit assignment for left: no conflict on either bank*)
    l0(s) /\ l0(A \ s)

Next == 
    /\ mvlr \/ mvrl
    /\ l(left')
    
\* INVARIANTS
Verif == 
    /\ left \subseteq A
    /\ l(left) (*every state is licit*)
=============================================================================
\* Modification History
\* Last modified Tue Feb 18 21:54:19 CET 2025 by Phan Trần Thiên Ân
\* Created Fri Feb 14 13:44:51 CET 2025 by Phan Tr?n Thiên Ân
