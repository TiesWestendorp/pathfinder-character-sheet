:- use_module(library(func)).
:- multifile supported/1.
:- multifile base/2.
:- multifile bonus/3.

supported(skill_rank(Skill)) :- skills(Skills), member(Skill, Skills).

skills([acrobatics, appraise, bluff, climb, craft(_), diplomacy, disable_device, disguise, escape_artist, fly,
handle_animal, heal, intimidate, knowledge(_), linguistics, perception, perform, profession, ride, sense_motive,
sleight_of_hand, spellcraft, stealth, survival, swim, use_magic_device]).

base(skill_ranks, 0).
base(skill_rank(_), 0).

% Skill ranks and class bonus
bonus(skill(Skill), ranks, Ranks) :- Ranks = predicate_count $ skill_rank(Skill).
bonus(skill(Skill), class, 3) :- class_skill(Skill), trained(Skill).
trained(Skill) :- bonus(skill(Skill)) $ ranks > 0.

% Ability modifiers
% TODO: max dex bonus
% TODO: ACP
bonus(skill(Skill), str, ability_modifier $ str) :- member(Skill, [climb, swim]).
bonus(skill(Skill), dex, ability_modifier $ dex) :- member(Skill, [acrobatics, disable_device, escape_artist, fly, ride, sleight_of_hand, stealth]).
bonus(skill(Skill), int, ability_modifier $ int) :- member(Skill, [appraise, craft(_), knowledge(_), linguistics, spellcraft]).
bonus(skill(Skill), wis, ability_modifier $ wis) :- member(Skill, [heal, perception, profession, sense_motive, survival]).
bonus(skill(Skill), cha, ability_modifier $ cha) :- member(Skill, [bluff, diplomacy, disguise, handle_animal, intimidate, perform, use_magic_device]).

% Trainedness
base(skill(acrobatics), 0).
base(skill(appraise), 0).
base(skill(bluff), 0).
base(skill(climb), 0).
base(skill(craft(any)), 0).
base(skill(craft(_)), 0).
base(skill(diplomacy), 0).
base(skill(disable_device), 0) :- trained(disable_device).
base(skill(disguise), 0).
base(skill(escape_artist), 0).
base(skill(fly), 0).
base(skill(handle_animal), 0) :- trained(handle_animal).
base(skill(heal), 0).
base(skill(intimidate), 0).
base(skill(knowledge(Knowledge)), 0) :- trained(knowledge(Knowledge)).
base(skill(linguistics), 0) :- trained(linguistics).
base(skill(perception), 0).
base(skill(perform), 0).
base(skill(profession), 0) :- trained(profession).
base(skill(ride), 0).
base(skill(sense_motive), 0).
base(skill(sleight_of_hand), 0) :- trained(sleight_of_hand).
base(skill(spellcraft), 0) :- trained(spellcraft).
base(skill(stealth), 0).
base(skill(survival), 0).
base(skill(swim), 0).
base(skill(use_magic_device), 0) :- trained(use_magic_device).
