:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(cloak_of_resistance(X))) :- member(X, [1, 2, 3, 4, 5]).

bonus(saving_throw(SavingThrow), resistance, X) :-
  equipment(cloak_of_resistance(X)),
  member(X, [1, 2, 3, 4, 5]),
  member(SavingThrow, [fortitude, reflex, will]).
slot(shoulders) :- equipment(cloak_of_resistance(X)), member(X, [1, 2, 3, 4, 5]).
weight(1) :- (equipment(cloak_of_resistance(X)); inventory(cloak_of_resistance(X))), member(X, [1, 2, 3, 4, 5]).
