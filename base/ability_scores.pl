:- multifile supported/1.
:- multifile base/2.
:- multifile bonus/3.

supported(ability_score(Ability, _)) :- member(Ability, [str, dex, con, int, wis, cha]).

base(ability(Ability), Score) :- ability_score(Ability, Score).

ability_modifier(Ability, Modifier) :-
  total_score(ability(Ability), Score),
  Modifier is div(Score, 2) - 5.

% TODO: check whether spell level can be cast at current level
bonus(spells_per_day(Class, SpellLevel), Ability, Bonus) :-
  casting_ability(Class, Ability),
  level(Class, _),
  ability_score(Ability, Modifier),
  member(SpellLevel, [1, 2, 3, 4, 5, 6, 7, 8, 9]),
  Bonus is ceil((Modifier + 1 - SpellLevel) / 2).
