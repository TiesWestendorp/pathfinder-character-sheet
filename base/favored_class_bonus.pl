:- multifile supported/1.
:- multifile bonus/3.

supported(favored_class_bonus(skill_rank)).
supported(favored_class_bonus(hitpoint)).

bonus(skill_ranks, favored_class_bonus, Bonus) :- bagof(_, favored_class_bonus(skill_rank), Bonuses), length(Bonuses, Bonus).
bonus(hitpoints, favored_class_bonus, Bonus)   :- bagof(_, favored_class_bonus(hitpoint), Bonuses), length(Bonuses, Bonus).