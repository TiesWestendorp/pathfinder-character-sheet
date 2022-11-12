:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(headband_of_inspired_wisdom(X))) :- member(X, [2, 4, 6]).

bonus(ability(wis), enhancement, X) :- equipment(headband_of_inspired_wisdom(X)), member(X, [2, 4, 6]).
slot(headband) :- equipment(headband_of_inspired_wisdom(X)), member(X, [2, 4, 6]).
weight(1) :- (equipment(headband_of_inspired_wisdom(X)); inventory(headband_of_inspired_wisdom(X))), member(X, [2, 4, 6]).
