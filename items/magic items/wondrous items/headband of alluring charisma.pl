:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(headband_of_alluring_charisma(X))) :- member(X, [2, 4, 6]).

bonus(ability(cha), enhancement, X) :- equipment(headband_of_alluring_charisma(X)), member(X, [2, 4, 6]).
slot(headband) :- equipment(headband_of_alluring_charisma(X)), member(X, [2, 4, 6]).
weight(1) :- (equipment(headband_of_alluring_charisma(X)); inventory(headband_of_alluring_charisma(X))), member(X, [2, 4, 6]).
