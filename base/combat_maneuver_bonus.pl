:- use_module(library(func)).
:- multifile base/2.
:- multifile bonus/3.

base(combat_maneuver_bonus(CombatManeuver), total_score $ base_attack_bonus) :-
  combat_maneuvers(CombatManeuvers),
  member(CombatManeuver, CombatManeuvers).

bonus(combat_maneuver_bonus(_), str, ability_modifier $ str) :- size(Size), size_class $ Size >  size_class $ tiny.
bonus(combat_maneuver_bonus(_), dex, ability_modifier $ dex) :- size(Size), size_class $ Size =< size_class $ tiny.
