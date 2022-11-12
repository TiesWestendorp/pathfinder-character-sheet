:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(ring_of_swimming)).

bonus(skill(swim), competence, 5) :- equipment(ring_of_swimming).
slot(ring) :- equipment(ring_of_swimming).
