\* :1:right:A \ left"$!@$!@$!@$!@$!"
---- MODULE TE ----
EXTENDS wgc, Toolbox, TLC

def_ov_173997361955949000 == 
<<
([left |-> {"Wolf", "Goat", "Cabbage", "Farmer"}]),
([left |-> {"Wolf", "Cabbage"}]),
([left |-> {"Wolf", "Cabbage", "Farmer"}]),
([left |-> {"Wolf"}]),
([left |-> {"Wolf", "Goat", "Farmer"}]),
([left |-> {"Goat"}]),
([left |-> {"Goat", "Farmer"}]),
([left |-> {}])
>>
----


\* TRACE EXPLORER variable declaration @traceExploreExpressions
VARIABLES right
----

\* TRACE EXPLORER identifier definition @traceExploreExpressions:0
trace_def_173997361952845000 ==
A \ left
----

\* TRACE Sub-Action definition 0
next_sa_0 ==
    (
        /\ left = (
                {"Wolf", "Goat", "Cabbage", "Farmer"}
            )
        /\ left' = (
                {"Wolf", "Cabbage"}
            )
        /\ right' = (
            trace_def_173997361952845000
            )'
    )

\* TRACE Sub-Action definition 1
next_sa_1 ==
    (
        /\ left = (
                {"Wolf", "Cabbage"}
            )
        /\ left' = (
                {"Wolf", "Cabbage", "Farmer"}
            )
        /\ right' = (
            trace_def_173997361952845000
            )'
    )

\* TRACE Sub-Action definition 2
next_sa_2 ==
    (
        /\ left = (
                {"Wolf", "Cabbage", "Farmer"}
            )
        /\ left' = (
                {"Wolf"}
            )
        /\ right' = (
            trace_def_173997361952845000
            )'
    )

\* TRACE Sub-Action definition 3
next_sa_3 ==
    (
        /\ left = (
                {"Wolf"}
            )
        /\ left' = (
                {"Wolf", "Goat", "Farmer"}
            )
        /\ right' = (
            trace_def_173997361952845000
            )'
    )

\* TRACE Sub-Action definition 4
next_sa_4 ==
    (
        /\ left = (
                {"Wolf", "Goat", "Farmer"}
            )
        /\ left' = (
                {"Goat"}
            )
        /\ right' = (
            trace_def_173997361952845000
            )'
    )

\* TRACE Sub-Action definition 5
next_sa_5 ==
    (
        /\ left = (
                {"Goat"}
            )
        /\ left' = (
                {"Goat", "Farmer"}
            )
        /\ right' = (
            trace_def_173997361952845000
            )'
    )

\* TRACE Sub-Action definition 6
next_sa_6 ==
    (
        /\ left = (
                {"Goat", "Farmer"}
            )
        /\ left' = (
                {}
            )
        /\ right' = (
            trace_def_173997361952845000
            )'
    )

\* TRACE Action Constraint definition traceExploreActionConstraint
action_constr_173997361952848000 ==
<<
next_sa_0,
next_sa_1,
next_sa_2,
next_sa_3,
next_sa_4,
next_sa_5,
next_sa_6
>>[TLCGet("level")]
----

\* TRACE INIT definition traceExploreInit
init_173997361952846000 ==
    /\ left = (
            {"Wolf", "Goat", "Cabbage", "Farmer"}
        )
    /\ right = (
            trace_def_173997361952845000
        )

----

\* TRACE NEXT definition traceExploreNext
next_173997361952847000 ==
    \/ next_sa_0
    \/ next_sa_1
    \/ next_sa_2
    \/ next_sa_3
    \/ next_sa_4
    \/ next_sa_5
    \/ next_sa_6


=============================================================================
\* Modification History
\* Created Wed Feb 19 15:00:19 CET 2025 by Phan Tr?n Thiên Ân
