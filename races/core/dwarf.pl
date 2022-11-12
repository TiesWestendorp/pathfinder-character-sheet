:- multifile supported/1.
:- multifile bonus/3.
:- multifile size/1.

supported(race(dwarf)).

bonus(ability(con), racial, 2) :- race(dwarf).
bonus(ability(wis), racial, 2) :- race(dwarf).
bonus(ability(cha), racial, -2) :- race(dwarf).

size(medium) :- race(dwarf).

% Languages
% Racial traits
% Favored class bonuses