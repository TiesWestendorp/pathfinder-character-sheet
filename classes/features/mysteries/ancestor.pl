:- multifile supported/1.
:- multifile class_skill/1.
:- multifile known_spell/3.

supported(mystery(ancestor)).

class_skill(Skill) :-
  class_feature(_, mystery(ancestor)),
  member(Skill, [linguistics, knowledge(_)]).

known_spell(Spell, mystery(ancestor), SpellLevel) :-
  class_feature(Class, mystery(ancestor)),
  level(Class, ClassLevel),
  member(Spell-RequiredLevel, [
    unseen_servant-2,
    spiritual_weapon-4,
    heroism-6,
    spiritual_ally-8,
    telekinesis-10,
    greater_heroism-12,
    ethereal_jaunt-14,
    vision-16,
    astral_projection-18
  ]),
  ClassLevel >= RequiredLevel,
  spell_source(Spell, mystery(ancestor), SpellLevel).

% TODO: revelations
% TODO: final revelation