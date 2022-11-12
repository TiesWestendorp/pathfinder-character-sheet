:- multifile supported/1.
:- multifile bonus/3.

supported(trait(hard_to_kill)).

% TODO: implement
bonus(initiative, trait, 2) :- trait(hard_to_kill).