:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.

supported(equipment(amulet_of_natural_armor(X))) :- member(X, [1, 2, 3, 4, 5]).

bonus(natural_armor, enhancement, X) :-
  current_predicate(equipment/1),
  equipment(amulet_of_natural_armor(X)),
  member(X, [1, 2, 3, 4, 5]).

slot(neck) :-
  current_predicate(equipment/1),
  equipment(amulet_of_natural_armor(X)),
  member(X, [1, 2, 3, 4, 5]).
