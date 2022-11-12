:- multifile spell_school/2.
:- multifile spell_source/3.

spell_school(detect_poison, divination).
spell_source(detect_poison, Source, Level) :- member(Source-Level, [
  class(antipaladin)-1,
  class(cleric)-0,
  class(oracle)-0,
  class(druid)-0,
  class(inquisitor)-0,
  class(paladin)-1,
  class(psychic)-0,
  class(ranger)-1,
  class(shaman)-0,
  class(sorcerer)-0,
  class(wizard)-0,
  class(witch)-0
]).