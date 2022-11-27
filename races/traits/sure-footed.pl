:- multifile supported/1.
:- multifile bonus/3.

supported(racial_trait(sure-footed)).

bonus(skill(acrobatics), racial, 2) :- racial_trait(sure-footed).
bonus(skill(climb), racial, 2) :- racial_trait(sure-footed).