:- [base/base].
:- [races/races].
:- [classes/classes].
:- ["classes/features/mysteries/dark tapestry"].
:- [items/items].
:- [feats/feats].
:- [spells/spells].
:- [sheet/sheet].
:- [traits/traits].

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
race(human).
bonus(ability(cha), racial, 2).
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
level(oracle).
mystery(dark_tapestry).
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
favored_class_bonus(racial).
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
equipment(breastplate).
equipment(dagger).

known_spell(blindness/deafness, class(oracle), 2).

feat(uncanny_dodge).
feat(spell_focus(necromancy)).
feat(greater_spell_focus(necromancy)).
feat(improved_initiative).
feat(spell_specialization(blindness/deafness)).

spell(Spell, Text) :-
  known_spell(Spell, _, SpellLevel),
  spell(Spell, SpellLevel, Text).

:- [validations/validations].

main :-
    character_sheet(X),
    phrase(X, Y),
    (   current_prolog_flag(argv, [File|_])
    ->  setup_call_cleanup(open(File, write, Out),
            print_html(Out, Y),
            close(Out))
    ;   print_html(Y)
    ).