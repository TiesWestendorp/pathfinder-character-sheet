:- multifile supported/1.
:- multifile bonus/3.

supported(favored_class_bonus(skill_rank)).
supported(favored_class_bonus(hitpoint)).

bonus(skill_ranks, favored_class_bonus, 1) :- favored_class_bonus(skill_rank).
bonus(hitpoints, favored_class_bonus, 1) :- favored_class_bonus(hitpoint).