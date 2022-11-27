:- multifile supported/1.
:- multifile class_skill/1.
:- multifile known_spell/4.

supported(mystery(dark_tapestry)).

class_skill(Skill) :-
  class_feature(_, mystery(dark_tapestry)),
  member(Skill, [disguise, intimidate, knowledge(arcana), stealth]).

known_spell(Spell, class(Class), SpellLevel, mystery(dark_tapestry)) :-
  class_feature(Class, mystery(dark_tapestry)),
  level(Class, ClassLevel),
  member(Spell-RequiredLevel, [
    entropic_shield-2,
    dust_of_twilight-4,
    tongues-6,
    black_tentacles-8,
    feeblemind-10,
    planar_binding-12,
    insanity-14,
    reverse_gravity-16,
    interplanetary_teleport-18
  ]),
  ClassLevel >= RequiredLevel,
  spell_source(Spell, mystery(dark_tapestry), SpellLevel).

% TODO: revelations
% TODO: final revelation