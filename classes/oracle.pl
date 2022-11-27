:- multifile supported/1.
:- multifile class_skill/1.
:- multifile bonus/3.
:- multifile casting_ability/2.
:- multifile class_feature/2.
:- multifile skill_ranks_progression/2.
:- multifile base_attack_bonus_progression/2.
:- multifile saving_throw_progression/2.

supported(level(oracle)).

class_skill(Skill) :- class(oracle), member(Skill, [
  craft(_),
  diplomacy,
  heal,
  knowledge(history),
  knowledge(planes),
  knowledge(religion),
  profession,
  sense_motive,
  spellcraft
]).

skill_ranks_progression(oracle, 4).
base_attack_bonus_progression(oracle, 3/4).
saving_throw_progression(oracle, [fortitude-low, reflex-low, will-high]).

casting_ability(oracle, cha).

proficiency(weapon(simple)) :- class(oracle).
proficiency(armor(light)) :- class(oracle).
proficiency(armor(medium)) :- class(oracle).
proficiency(shield(regular)) :- class(oracle).

class_feature(oracle, mystery(Mystery))             :- member(mystery(Mystery), class $ oracle).
class_feature(oracle, spellcasting_oracle(cure))    :- member(spellcasting_oracle(cure), class $ oracle).
class_feature(oracle, spellcasting_oracle(inflict)) :- member(spellcasting_oracle(inflict), class $ oracle).

% TODO: complete