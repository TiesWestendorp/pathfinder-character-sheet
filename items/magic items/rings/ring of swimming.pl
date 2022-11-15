:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.

supported(equipment(ring_of_swimming)).
supported(inventory(ring_of_swimming)).

bonus(skill(swim), competence, 5) :-
  current_predicate(equipment/1),
  equipment(ring_of_swimming).

slot(ring) :-
  current_predicate(equipment/1),
  equipment(ring_of_swimming).
