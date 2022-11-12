:- multifile supported/1.
:- multifile bonus/3.

supported(feat(improved_initiative)).

bonus(initiative, improved_initiative, 4) :- feat(improved_initiative).
