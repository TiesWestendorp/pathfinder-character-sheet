:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.

supported(equipment(ring_of_climbing)).
supported(inventory(ring_of_climbing)).

bonus(skill(climb), competence, 5) :-
  current_predicate(equipment/1),
  equipment(ring_of_climbing).

slot(ring) :-
  current_predicate(equipment/1),
  equipment(ring_of_climbing).
