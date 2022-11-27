:- multifile supported/1.
:- multifile bonus/3.

supported(racial_trait(keen_senses)).

bonus(skill(perception), racial, 2) :- racial_trait(keen_senses).
