:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(cloak_of_resistance(X))) :- member(X, [1, 2, 3, 4, 5]).

bonus(saving_throw(SavingThrow), resistance, X) :-
  current_predicate(equipment/1),
  equipment(cloak_of_resistance(X)),
  member(X, [1, 2, 3, 4, 5]),
  member(SavingThrow, [fortitude, reflex, will]).

slot(shoulders) :-
  current_predicate(equipment/1),
  equipment(cloak_of_resistance(X)),
  member(X, [1, 2, 3, 4, 5]).

weight(1) :-
  (
    current_predicate(equipment/1),
    equipment(cloak_of_resistance(X));
    current_predicate(inventory/1),
    inventory(cloak_of_resistance(X))
  ),
  member(X, [1, 2, 3, 4, 5]).
