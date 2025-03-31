------------------------------ MODULE 3islands ------------------------------
EXTENDS Naturals

\* Problem params/inputs
N == 3
F == "F"
Safe == {F}
Unsafe == { {"W1", "G"}, {"W2", "G"}, {"G", "C"} }

\* Derived inputs, helper functions, input typing
Locs == 1..N
A == Safe \union UNION Unsafe

ASSUME
    /\ N \in Nat\{0}
    /\ Safe \intersect UNION Unsafe = {}
    /\ F \in A
    
\* State variables
VARIABLES l
Type == 
    /\ l \in [Locs -> SUBSET A]
    /\ \A x, y \in Locs: x /= y => l[x] \intersect l[y] = {}
    /\ UNION { l[x] : x \in Locs } = A

\* Initial state
Init == l = <<A, {}, {}>>

\* Transitions
Licit(S) ==
    /\ \A G \in Unsafe: G \subseteq S => F \in S
    
Next == 
    /\ \E i, j \in Locs : \E a \in l[i] : 
                                        /\ F \in l[i]
                                        /\ l' = [l EXCEPT
                                                    ![i] = @ \ {F, a},
                                                    ![j] = @ \union {F, a} ]
                                        /\ Type
                                        /\ \A k \in Locs: Licit(l'[k])

\* Invariants & Reachability targets
Target == l = <<{}, {}, A>>
    
Inv == 
    /\ Type
    /\ \A i \in Locs : Licit(l[i])
    /\ ~Target

=============================================================================
\* Modification History
\* Last modified Mon Mar 31 20:51:40 CEST 2025 by Phan Trần Thiên Ân
\* Created Mon Mar 31 14:32:25 CEST 2025 by Phan Tr?n Thiên Ân
