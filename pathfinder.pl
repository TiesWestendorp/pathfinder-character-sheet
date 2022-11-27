:- discontiguous level/1.
:- discontiguous favored_class_bonus/1.
:- discontiguous equipment/1.
:- discontiguous feat/1.
:- discontiguous skill_rank/1.
:- multifile known_spell/3.

% Base
name("The Mad Prophet").
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
class(oracle, [spellcasting_oracle(cure), mystery(dark_tapestry)]).
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

known_spell(blindness/deafness, class(oracle), 3).

feat(uncanny_dodge).
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
:- [sheet/sheet].
:- [traits/traits].
:- [validations/validations].

:- use_module(library(st/st_render)).

main :-
    bagof(_{ name: Name, score: Score, bonuses: Bonuses }, Ability^(total_score(ability(Ability), Score), typed_bonuses_string(ability(Ability), Bonuses), term_string(Ability, Name)), Abilities),
    bagof(_{ name: Name, score: Score, bonuses: Bonuses }, Skill^(total_score(skill(Skill), Score), typed_bonuses_string(skill(Skill), Bonuses), ground(Skill), term_string(Skill, Name)), Skills),
    bagof(_{ name: Name }, feat(Name), Feats),
    name(Name),
    portrait(Portrait),
    race(Race, _),
    Data =  _{
      name: Name,
      portrait: Portrait,
      race: Race,
      abilities: Abilities,
      skills: Skills,
      feats: Feats
    },
    Options = [],
    (   current_prolog_flag(argv, [File|_])
    ->  setup_call_cleanup(
            open(File, write, Out),
            st_render_file(sheet/template, Data, Out, Options),
            close(Out))
    %;   print_html(Y)
    ).