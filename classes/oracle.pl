:- multifile supported/1.
:- multifile class_skill/1.
:- multifile bonus/3.
:- multifile casting_ability/2.
:- multifile class_feature/2.

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

bonus(skill_ranks, oracle, SkillRanks) :-
  level(oracle, Level),
  ability_modifier(int, IntModifier),
  SkillRanks is Level * max(IntModifier + 4, 0).

bonus(base_attack_bonus, oracle, Bab) :- level(oracle, Level), Bab is floor(Level*3/4).

casting_ability(oracle, cha).

proficiency(weapon(simple)) :- class(oracle).
proficiency(armor(light)) :- class(oracle).
proficiency(armor(medium)) :- class(oracle).
proficiency(shield(regular)) :- class(oracle).

class_feature(oracle, mystery) :- class(oracle).

% TODO: complete