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
:- multifile known_spell/3.

% Base
name("The Mad Prophet").
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
% TODO: languages

% Level 1
level(oracle).
mystery(dark_tapestry).
favored_class_bonus(hitpoint).
bonus(combat_maneuver_bonus(trip), racial, 10).
skill_rank(profession).
bonus(skill(craft(potion)), feat, 3).

% Level 2
level(oracle).
favored_class_bonus(racial).

% Level 3
level(oracle).
favored_class_bonus(skill_rank).

% Level 4
level(oracle).
favored_class_bonus(hitpoint).

% Level 5
level(oracle).
favored_class_bonus(hitpoint).

% Level 6
level(oracle).
favored_class_bonus(hitpoint).

equipment(headband_of_alluring_charisma(2)).
equipment(breastplate).
equipment(dagger).

known_spell(blindness/deafness, class(oracle), 2).

feat(uncanny_dodge).
feat(spell_focus(necromancy)).
feat(greater_spell_focus(necromancy)).
feat(improved_initiative).
feat(spell_specialization(blindness/deafness)).

%to_hit_ability(Ability) :- feat(weapon_finesse), !, Ability = dex; Ability = str.

saves(Fort, Ref, Will) :-
  Fort is 0,
  Ref is 0,
  Will is 0.

spell(Spell, Text) :-
  known_spell(Spell, _, SpellLevel),
  spell(Spell, SpellLevel, Text).

:- [validations/validations].