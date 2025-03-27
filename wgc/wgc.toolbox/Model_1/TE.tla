\* :1:right:A \ left"$!@$!@$!@$!@$!"
---- MODULE TE ----
EXTENDS wgc, Toolbox, TLC

def_ov_174100675526222000 == 
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
trace_def_174100675521818000 ==
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
            trace_def_174100675521818000
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
            trace_def_174100675521818000
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
            trace_def_174100675521818000
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
            trace_def_174100675521818000
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
            trace_def_174100675521818000
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
            trace_def_174100675521818000
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
            trace_def_174100675521818000
            )'
    )

\* TRACE Action Constraint definition traceExploreActionConstraint
action_constr_174100675521821000 ==
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
init_174100675521819000 ==
    /\ left = (
            {"Wolf", "Goat", "Cabbage", "Farmer"}
        )
    /\ right = (
            trace_def_174100675521818000
        )

----

\* TRACE NEXT definition traceExploreNext
next_174100675521820000 ==
    \/ next_sa_0
    \/ next_sa_1
    \/ next_sa_2
    \/ next_sa_3
    \/ next_sa_4
    \/ next_sa_5
    \/ next_sa_6


=============================================================================
\* Modification History
\* Created Mon Mar 03 13:59:15 CET 2025 by Phan Tr?n Thiên Ân
