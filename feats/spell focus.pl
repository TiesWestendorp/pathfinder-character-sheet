:- multifile supported/1.
:- multifile bonus/3.

supported(feat(spell_focus(School))) :- member(School, [
  abjuration,
  conjuration,
  divination,
  enchantment,
  evocation,
  illusion,
  necromancy,
  transmutation
]).

bonus(difficulty_class(_, Spell), spell_focus, 1) :-
  feat(spell_focus(School)),
  spell_school(Spell, School).
