:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(ring_of_protection(X))) :- member(X, [1, 2, 3, 4, 5]).

bonus(armor_class, enhancement, X) :- equipment(ring_of_protection(X)), member(X, [1, 2, 3, 4, 5]).
slot(ring) :- equipment(ring_of_protection(X)), member(X, [1, 2, 3, 4, 5]).
