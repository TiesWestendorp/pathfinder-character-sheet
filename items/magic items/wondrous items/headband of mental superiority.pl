:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(headband_of_mental_superiority(X))) :- member(X, [2, 4, 6]).

bonus(ability(Ability), enhancement, X) :-
  equipment(headband_of_mental_superiority(X)),
  member(X, [2, 4, 6]),
  member(Ability, [str, dex, con]).
slot(headband) :- equipment(headband_of_mental_superiority(X)), member(X, [2, 4, 6]).
weight(1) :- (equipment(headband_of_mental_superiority(X)); inventory(headband_of_mental_superiority(X))), member(X, [2, 4, 6]).
