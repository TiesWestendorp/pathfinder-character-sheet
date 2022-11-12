:- multifile base/2.
:- multifile bonus/3.

base(combat_maneuver_bonus(CombatManeuver), BaseAttackBonus) :-
  total_score(base_attack_bonus, BaseAttackBonus),
  combat_maneuvers(CombatManeuvers),
  member(CombatManeuver, CombatManeuvers).

bonus(combat_maneuver_bonus(_), str, Modifier) :-
  size(Size),
  size_class(Size, SizeClass),
  size_class(tiny, TinyClass),
  SizeClass > TinyClass,
  ability_modifier(str, Modifier).

bonus(combat_maneuver_bonus(_), dex, Modifier) :-
  size(Size),
  size_class(Size, SizeClass),
  size_class(tiny, TinyClass),
  SizeClass =< TinyClass,
  ability_modifier(dex, Modifier).
