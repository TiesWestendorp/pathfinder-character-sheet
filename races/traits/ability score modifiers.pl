:- multifile supported/1.
:- multifile bonus/3.

supported(racial_trait(ability_score_modifiers(Ability))) :- member(Ability, [str, dex, con, int, wis, cha]).

bonus(ability(Ability), racial, 2) :- racial_trait(ability_score_modifiers(Ability)).