:- multifile base/2.
:- multifile bonus/3.

base(initiative, 0).
bonus(initiative, dex, Modifier) :- ability_modifier(dex, Modifier).