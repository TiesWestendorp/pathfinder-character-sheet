:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(headband_of_mental_superiority(X))) :- member(X, [2, 4, 6]).

bonus(ability(Ability), enhancement, X) :-
  current_predicate(equipment/1),
  equipment(headband_of_mental_superiority(X)),
  member(X, [2, 4, 6]),
  member(Ability, [str, dex, con]).

slot(headband) :-
  current_predicate(equipment/1),
  equipment(headband_of_mental_superiority(X)),
  member(X, [2, 4, 6]).

weight(1) :-
  (
    current_predicate(equipment/1),
    equipment(headband_of_mental_superiority(X));
    current_predicate(inventory/1),
    inventory(headband_of_mental_superiority(X))
  ),
  member(X, [2, 4, 6]).
