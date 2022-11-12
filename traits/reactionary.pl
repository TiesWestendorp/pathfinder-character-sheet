:- multifile supported/1.
:- multifile bonus/3.

supported(trait(reactionary)).

bonus(initiative, trait, 2) :- trait(reactionary).