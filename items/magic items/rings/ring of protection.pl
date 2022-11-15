:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.

supported(equipment(ring_of_protection(X))) :- member(X, [1, 2, 3, 4, 5]).
supported(inventory(ring_of_protection(X))) :- member(X, [1, 2, 3, 4, 5]).

bonus(armor_class, enhancement, X) :-
  current_predicate(equipment/1),
  equipment(ring_of_protection(X)),
  member(X, [1, 2, 3, 4, 5]).

slot(ring) :-
  current_predicate(equipment/1),
  equipment(ring_of_protection(X)),
  member(X, [1, 2, 3, 4, 5]).
