:- multifile supported/1.
:- multifile bonus/3.
:- multifile size/1.

supported(race(gnome)).

bonus(ability(con), racial, 2) :- race(gnome).
bonus(ability(cha), racial, 2) :- race(gnome).
bonus(ability(str), racial, -2) :- race(gnome).

size(small) :- race(elf).
