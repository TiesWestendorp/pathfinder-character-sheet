:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.
:- multifile weight/1.

supported(equipment(cloak_of_elvenkind)).

bonus(skill(stealth), competence, 5) :- equipment(cloak_of_elvenkind).
slot(shoulders) :- equipment(cloak_of_elvenkind).
weight(1) :- equipment(cloak_of_elvenkind); inventory(cloak_of_elvenkind).
