:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(belt_of_giant_strength(X))) :- member(X, [2, 4, 6]).

bonus(ability(str), enhancement, X) :-
  current_predicate(equipment/1),
  equipment(belt_of_giant_strength(X)),
  member(X, [2, 4, 6]).

slot(belt) :-
  current_predicate(equipment/1),
  equipment(belt_of_giant_strength(X)),
  member(X, [2, 4, 6]).

weight(1) :-
  (
    current_predicate(equipment/1),
    equipment(belt_of_giant_strength(X));
    current_predicate(inventory/1),
    inventory(belt_of_giant_strength(X))
  ),
  member(X, [2, 4, 6]).
