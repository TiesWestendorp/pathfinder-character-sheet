:- multifile supported/1.
:- multifile bonus/3.

supported(racial_trait(halfling_luck)).

bonus(saving_throw(_), racial, 1) :- racial_trait(halfling_luck).