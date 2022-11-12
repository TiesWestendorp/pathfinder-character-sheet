:- multifile spell_school/2.
:- multifile spell_source/3.

spell_school(detect_magic, divination).
spell_source(detect_magic, Source, Level) :- member(Source-Level, [
  class(bard)-0,
  class(cleric)-0,
  class(oracle)-0,
  class(druid)-0,
  class(inquisitor)-0,
  class(magus)-0,
  class(psychic)-0,
  class(shaman)-0,
  class(sorcerer)-0,
  class(wizard)-0,
  class(summoner)-0,
  class(unchained_summoner)-0,
  class(witch)-0
]).