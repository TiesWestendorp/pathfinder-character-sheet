:- multifile supported/1.
:- multifile bonus/3.
:- multifile size/1.
:- multifile language/1.

supported(race(elf)).

bonus(ability(dex), racial, 2) :- race(elf).
bonus(ability(int), racial, 2) :- race(elf).
bonus(ability(con), racial, -2) :- race(elf).

size(medium) :- race(elf).

language(Language) :- race(elf), member(Language, [common, elven]).
