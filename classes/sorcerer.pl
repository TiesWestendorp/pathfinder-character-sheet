:- multifile supported/1.
:- multifile class_skill/1.
:- multifile bonus/3.
:- multifile casting_ability/2.
:- multifile skill_ranks_progression/2.
:- multifile base_attack_bonus_progression/2.
:- multifile saving_throw_progression/2.

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

skill_ranks_progression(sorcerer, 2).
base_attack_bonus_progression(sorcerer, 1/2).
saving_throw_progression(sorcerer, [fortitude-low, reflex-low, will-high]).

casting_ability(sorcerer, cha).

% TODO: complete