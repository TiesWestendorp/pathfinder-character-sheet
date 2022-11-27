:- discontiguous level/1.
:- discontiguous favored_class_bonus/1.
:- discontiguous equipment/1.
:- discontiguous feat/1.
:- discontiguous skill_rank/1.
:- multifile known_spell/4.

% Base
name("The Mad Prophet").
description("Filled with incredible purpose, he seeks out to unmask and stop supposed harbingers of an oncoming apocalypse. Are his utterings portents of things to come, or are they the ravings of a madman? While most claim the latter, maybe he is the only sane person and everyone else is crazy instead?").
portrait("the mad prophet.png").
gender(male).
race(human, [ability_score_modifiers(cha), bonus_feat, speed(20)]).
favored_class(oracle).
ability_score_method(roll).
ability_score(str, 7).
ability_score(dex, 13).
ability_score(con, 11).
ability_score(int, 12).
ability_score(wis, 11).
ability_score(cha, 15).
trait(reactionary).
trait(hard_to_kill).

% Level 1
class(oracle, [
  spellcasting_oracle(cure),
  mystery(dark_tapestry),
  oracles_curse(powerless_prophecy)
]).
level(oracle).
favored_class_bonus(hitpoint).
skill_rank(climb).
skill_rank(knowledge(arcana)).
skill_rank(knowledge(planes)).
skill_rank(knowledge(religion)).
skill_rank(perception).
skill_rank(stealth).

% Level 2
level(oracle).
favored_class_bonus(hitpoint).
skill_rank(climb).
skill_rank(knowledge(arcana)).
skill_rank(knowledge(planes)).
skill_rank(knowledge(religion)).
skill_rank(perception).
skill_rank(stealth).

% Level 3
level(oracle).
favored_class_bonus(hitpoint).
skill_rank(linguistics).
skill_rank(knowledge(arcana)).
skill_rank(knowledge(planes)).
skill_rank(knowledge(religion)).
skill_rank(perception).
skill_rank(stealth).

% Level 4
level(oracle).
favored_class_bonus(racial).
bonus(ability(dex), level4, 1).
skill_rank(diplomacy).
skill_rank(knowledge(arcana)).
skill_rank(knowledge(planes)).
skill_rank(knowledge(religion)).
skill_rank(perception).
skill_rank(stealth).

% Level 5
level(oracle).
favored_class_bonus(racial).
skill_rank(intimidate).
skill_rank(knowledge(arcana)).
skill_rank(knowledge(planes)).
skill_rank(knowledge(religion)).
skill_rank(perception).
skill_rank(stealth).

% Level 6
level(oracle).
favored_class_bonus(racial).
skill_rank(knowledge(arcana)).
skill_rank(knowledge(history)).
skill_rank(knowledge(planes)).
skill_rank(knowledge(religion)).
skill_rank(perception).
skill_rank(stealth).

equipment(headband_of_alluring_charisma(2)).
inventory(headband_of_alluring_charisma(2)).
inventory(headband_of_alluring_charisma(2)).
equipment(agile_breastplate).
equipment(dagger).

known_spell(blindness/deafness, class(oracle), 3, choice).

feat(spell_focus(necromancy)).
feat(greater_spell_focus(necromancy)).
feat(improved_initiative).
feat(spell_specialization(blindness/deafness)).

:- [base/base].
:- [races/races].
:- [classes/classes].
:- [items/items].
:- [feats/feats].
:- [spells/spells].
:- [traits/traits].
:- [sheet/helpers].
:- [validations/validations].

:- use_module(library(st/st_render)).

entity_hash(Entity, Signed, _{ name: Name, score: Score, bonuses: Bonuses }) :-
  ( Signed = unsigned, Score = number_string $ total_score $ Entity
  ; Signed = signed,   Score = number_signed_string $ total_score $ Entity),
  Bonuses = typed_bonuses_string $ Entity,
  Name = term_string $ strip_first_functor $ Entity,
  ground(Entity).

main :-
    bagof(_{ name: Name, score: Score, bonuses: Bonuses }, Ability^(total_score(ability(Ability), Score), typed_bonuses_string(ability(Ability), Bonuses), term_string(Ability, Name)), Abilities),
    bagof(_{ name: Name }, feat(Name), Feats),
    name(Name),
    description(Description),
    portrait(Portrait),
    race(Race, _),
    entity_hash(hitpoints, unsigned, Hitpoints),
    entity_hash(initiative, signed, Initiative),
    entity_hash(skill(perception), signed, Perception),
    entity_hash(base_attack_bonus, signed, Bab),
    bagof(Hash, SavingThrow^entity_hash(saving_throw(SavingThrow), signed, Hash), SavingThrows),
    bagof(Hash, ArmorClass^entity_hash(armor_class(ArmorClass), unsigned, Hash), ArmorClasses),
    bagof(Hash, Skill^entity_hash(skill(Skill), signed, Hash), Skills),
    entity_hash(skill_ranks, unsigned, SkillRanks),
    UsedSkillRanks = predicate_count $ skill_rank,
    Data =  _{
      general: _{
        name: Name,
        description: Description,
        classlevels: bagof(_{ class: Class, level: ClassLevel }) $ level(Class, ClassLevel),
        portrait: Portrait,
        initiative: Initiative,
        perception: Perception,
        race: Race
      },
      defense: _{
        hitpoints: Hitpoints,
        armor_classes: ArmorClasses,
        saving_throws: SavingThrows
      },
      statistics: _{
        bab: Bab,
        abilities: Abilities,
        used_skill_ranks: UsedSkillRanks,
        skill_ranks: SkillRanks,
        skills: Skills,
        feats: Feats,
        class_spells: []
      }
    },
    Options = [],
    (   current_prolog_flag(argv, [File|_])
    ->  setup_call_cleanup(
            open(File, write, Out),
            st_render_file(sheet/template, Data, Out, Options),
            close(Out))
    %;   print_html(Y)
    ).