:- multifile spell_school/2.
:- multifile spell_source/3.

spell_school(guidance, divination).
spell_source(guidance, Source, Level) :- member(Source-Level, [
  class(cleric)-0,
  class(oracle)-0,
  class(druid)-0,
  class(inquisitor)-0,
  class(summoner)-0,
  class(unchained_summoner)-0,
  class(witch)-0,
  elemental_school(void)-0
]).