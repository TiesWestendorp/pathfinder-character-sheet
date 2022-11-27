:- multifile base/2.
:- multifile bonus/3.
:- multifile known_spell/3.

% Oracle spells known
base(spells_known(oracle, SpellLevel), Base) :-
  class_feature(Class, spellcasting_oracle(_)),
  level(Class, ClassLevel),
  ( ClassLevel = 1,  member(SpellLevel-Base, [0-4, 1-2])
  ; ClassLevel = 2,  member(SpellLevel-Base, [0-5, 1-2])
  ; ClassLevel = 3,  member(SpellLevel-Base, [0-5, 1-3])
  ; ClassLevel = 4,  member(SpellLevel-Base, [0-6, 1-3, 2-1])
  ; ClassLevel = 5,  member(SpellLevel-Base, [0-6, 1-4, 2-2])
  ; ClassLevel = 6,  member(SpellLevel-Base, [0-7, 1-4, 2-2, 3-1])
  ; ClassLevel = 7,  member(SpellLevel-Base, [0-7, 1-5, 2-3, 3-2])
  ; ClassLevel = 8,  member(SpellLevel-Base, [0-8, 1-5, 2-3, 3-2, 4-1])
  ; ClassLevel = 9,  member(SpellLevel-Base, [0-8, 1-5, 2-4, 3-3, 4-2])
  ; ClassLevel = 10, member(SpellLevel-Base, [0-9, 1-5, 2-4, 3-3, 4-2, 5-1])
  ; ClassLevel = 11, member(SpellLevel-Base, [0-9, 1-5, 2-5, 3-4, 4-3, 5-2])
  ; ClassLevel = 12, member(SpellLevel-Base, [0-9, 1-5, 2-5, 3-4, 4-3, 5-2, 6-1])
  ; ClassLevel = 13, member(SpellLevel-Base, [0-9, 1-5, 2-5, 3-4, 4-4, 5-3, 6-2])
  ; ClassLevel = 14, member(SpellLevel-Base, [0-9, 1-5, 2-5, 3-4, 4-4, 5-3, 6-2, 7-1])
  ; ClassLevel = 15, member(SpellLevel-Base, [0-9, 1-5, 2-5, 3-4, 4-4, 5-4, 6-3, 7-2])
  ; ClassLevel = 16, member(SpellLevel-Base, [0-9, 1-5, 2-5, 3-4, 4-4, 5-4, 6-3, 7-2, 8-1])
  ; ClassLevel = 17, member(SpellLevel-Base, [0-9, 1-5, 2-5, 3-4, 4-4, 5-4, 6-3, 7-3, 8-2])
  ; ClassLevel = 18, member(SpellLevel-Base, [0-9, 1-5, 2-5, 3-4, 4-4, 5-4, 6-3, 7-3, 8-2, 9-1])
  ; ClassLevel = 19, member(SpellLevel-Base, [0-9, 1-5, 2-5, 3-4, 4-4, 5-4, 6-3, 7-3, 8-3, 9-2])
  ; ClassLevel = 20, member(SpellLevel-Base, [0-9, 1-5, 2-5, 3-4, 4-4, 5-4, 6-3, 7-3, 8-3, 9-3])
  ).

% Difficulty class % TODO: check if spell has DC at all
base(difficulty_class(oracle, Spell), 10) :- known_spell(Spell, class(oracle), _), spell_saving_throw(Spell, _, _).
bonus(difficulty_class(oracle, Spell), level, SpellLevel) :- known_spell(Spell, class(oracle), SpellLevel).
bonus(difficulty_class(oracle, _), cha, Modifier) :- ability_modifier(cha, Modifier).

% Cure/Inflict spells
known_spell(Spell, class(oracle), SpellLevel) :-
  class_feature(_, spellcasting_oracle(cure)),
  member(Spell, [
    cure_light_wounds,
    cure_moderate_wounds,
    cure_serious_wounds,
    cure_critical_wounds,
    mass_cure_light_wounds,
    mass_cure_moderate_wounds,
    mass_cure_serious_wounds,
    mass_cure_critical_wounds
  ]),
  spell_source(Spell, class(oracle), SpellLevel),
  base(spells_known(oracle, SpellLevel), _).

known_spell(Spell, class(oracle), SpellLevel) :-
  class_feature(_, spellcasting_oracle(inflict)),
  member(Spell, [
    inflict_light_wounds,
    inflict_moderate_wounds,
    inflict_serious_wounds,
    inflict_critical_wounds,
    mass_inflict_light_wounds,
    mass_inflict_moderate_wounds,
    mass_inflict_serious_wounds,
    mass_inflict_critical_wounds
  ]),
  spell_source(Spell, class(oracle), SpellLevel),
  base(spells_known(oracle, SpellLevel), _).
