:- multifile supported/1.
:- multifile bonus/3.
:- multifile size/1.

supported(race(halfling)).

bonus(ability(dex), racial, 2) :- race(halfling).
bonus(ability(cha), racial, 2) :- race(halfling).
bonus(ability(str), racial, -2) :- race(halfling).

size(small) :- race(halfling).
