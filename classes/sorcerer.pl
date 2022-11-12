:- multifile supported/1.
:- multifile class_skill/1.
:- multifile bonus/3.
:- multifile casting_ability/2.

supported(level(sorcerer)).

class_skill(Skill) :- class(sorcerer), member(Skill, [
  appraise,
  bluff,
  craft(_),
  fly,
  intimidate,
  knowledge(arcana),
  profession,
  spellcraft,
  use_magic_device
]).

bonus(skill_ranks, oracle, SkillRanks) :-
  level(oracle, Level),
  ability_modifier(int, IntModifier),
  SkillRanks is Level * max(IntModifier + 2, 0).

bonus(base_attack_bonus, sorcerer, Bab) :- level(sorcerer, Level), Bab is floor(Level*1/2).

casting_ability(sorcerer, cha).

% TODO: complete