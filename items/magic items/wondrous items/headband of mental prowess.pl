:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(headband_of_mental_prowess(X, Ability1, Ability2))) :-
  member(X, [2, 4, 6]),
  member(Ability1, [int, wis, cha]),
  member(Ability2, [int, wis, cha]),
  Ability1 \== Ability2.

bonus(ability(Ability), enhancement, X) :-
  current_predicate(equipment/1),
  equipment(headband_of_mental_prowess(X, Ability1, Ability2)),
  member(X, [2, 4, 6]),
  member(Ability1, [int, wis, cha]),
  member(Ability2, [int, wis, cha]),
  Ability1 \== Ability2,
  member(Ability, [Ability1, Ability2]).

slot(headband) :-
  current_predicate(equipment/1),
  equipment(headband_of_mental_prowess(X, Ability1, Ability2)),
  member(X, [2, 4, 6]),
  member(Ability1, [int, wis, cha]),
  member(Ability2, [int, wis, cha]),
  Ability1 \== Ability2.

weight(1) :-
  (
    current_predicate(equipment/1),
    equipment(headband_of_mental_prowess(X, Ability1, Ability2));
    current_predicate(inventory/1),
    inventory(headband_of_mental_prowess(X, Ability1, Ability2))
  ),
  member(X, [2, 4, 6]),
  member(Ability1, [int, wis, cha]),
  member(Ability2, [int, wis, cha]),
  Ability1 \== Ability2.
