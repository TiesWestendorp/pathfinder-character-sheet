:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(cloak_of_elvenkind)).

bonus(skill(stealth), competence, 5) :-
  current_predicate(equipment/1),
  equipment(cloak_of_elvenkind).

slot(shoulders) :-
  current_predicate(equipment/1),
  equipment(cloak_of_elvenkind).

weight(1) :-
  current_predicate(equipment/1),
  equipment(cloak_of_elvenkind);
  current_predicate(inventory/1),
  inventory(cloak_of_elvenkind).
