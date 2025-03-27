-------------------------------- MODULE indy --------------------------------
EXTENDS Naturals, TLC

\* Problem params/inputs
tau == [I |-> 1, G |-> 2, W |-> 4, K |-> 8, L |-> 0]
maxt == 15

\* Derived inputs, helper functions, input typing
A == DOMAIN tau
L == "L"

max(S) == CHOOSE x \in S: \A y \in S: y <= x
maxtau(S) == max({ tau[a] : a \in S })

ASSUME
    /\ tau \in [A -> Nat]
    /\ maxt \in Nat
    /\ L \in A

\* State variables
VARIABLES left, time
Type ==
    /\ left \subseteq A
    /\ time \in 0..maxt
    
\* Initial state
Init == 
    /\ left = A
    /\ time = 0

\* Transitions
Next ==
    /\
        ( 
            \/ (
                /\ L \in left
                /\ \E p \in left \ {L}:
                    /\ left' = left \ {p, L}
                    /\ time' = time + maxtau({ p, L })
                )
            \/ ( 
                /\ L \in left
                /\ \E p1 \in left \ {L}, p2 \in left \ {L}:
                    /\ p1 /= p2
                    /\ left' = left \ {p1, p2, L}
                    /\ time' = time + maxtau({ p1, p2, L }) 
                )
            \/ ( 
                /\ L \in (A \ left)
                /\ \E p \in (A \ left) \ {L}:
                    /\ left' = left \union {p, L}
                    /\ time' = time + maxtau({ p, L }) 
                )
            \/ (
                /\ L \in (A \ left)
                /\ \E p1 \in (A \ left) \ {L}, p2 \in (A \ left) \ {L}:
                    /\ p1 /= p2
                    /\ left' = left \union {p1, p2, L}
                    /\ time' = time + maxtau({ p1, p2, L }) 
                )
        )
    /\ time' <= maxt
    
         

\* Invariants & Reachability targets
Target ==
    left = {}
    
Inv ==
    /\ Type
    /\ ~Target
    /\ time <= maxt
=============================================================================
\* Modification History
\* Last modified Thu Mar 27 16:20:05 CET 2025 by Phan Trần Thiên Ân
\* Created Wed Feb 19 15:35:05 CET 2025 by Phan Tr?n Thiên Ân
