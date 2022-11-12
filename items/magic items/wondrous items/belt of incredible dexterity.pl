:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(belt_of_incredible_dexterity(X))) :- member(X, [2, 4, 6]).

bonus(ability(dex), enhancement, X) :- equipment(belt_of_incredible_dexterity(X)), member(X, [2, 4, 6]).
slot(belt) :- equipment(belt_of_incredible_dexterity(X)), member(X, [2, 4, 6]).
weight(1) :- (equipment(belt_of_incredible_dexterity(X)); inventory(belt_of_incredible_dexterity(X))), member(X, [2, 4, 6]).
