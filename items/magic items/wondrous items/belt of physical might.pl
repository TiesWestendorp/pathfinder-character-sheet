:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(belt_of_physical_might(X, Ability1, Ability2))) :-
  member(X, [2, 4, 6]),
  member(Ability1, [str, dex, con]),
  member(Ability2, [str, dex, con]),
  Ability1 \== Ability2.

bonus(ability(Ability), enhancement, X) :-
  current_predicate(equipment/1),
  equipment(belt_of_physical_might(X, Ability1, Ability2)),
  member(X, [2, 4, 6]),
  member(Ability1, [str, dex, con]),
  member(Ability2, [str, dex, con]),
  Ability1 \== Ability2,
  member(Ability, [Ability1, Ability2]).

slot(belt) :-
  current_predicate(equipment/1),
  equipment(belt_of_physical_might(X, Ability1, Ability2)),
  member(X, [2, 4, 6]),
  member(Ability1, [str, dex, con]),
  member(Ability2, [str, dex, con]),
  Ability1 \== Ability2.

weight(1) :-
  (
    current_predicate(equipment/1),
    equipment(belt_of_physical_might(X, Ability1, Ability2));
    current_predicate(inventory/1),
    inventory(belt_of_physical_might(X, Ability1, Ability2))
  ),
  member(X, [2, 4, 6]),
  member(Ability1, [str, dex, con]),
  member(Ability2, [str, dex, con]),
  Ability1 \== Ability2.
