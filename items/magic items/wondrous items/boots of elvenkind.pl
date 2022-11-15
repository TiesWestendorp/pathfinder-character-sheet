:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(boots_of_elvenkind)).

bonus(skill(acrobatics), competence, 5) :-
  current_predicate(equipment/1),
  equipment(boots_of_elvenkind).

slot(feet) :-
  current_predicate(equipment/1),
  equipment(boots_of_elvenkind).

weight(1) :-
  current_predicate(equipment/1),
  equipment(boots_of_elvenkind);
  current_predicate(inventory/1),
  inventory(boots_of_elvenkind).
