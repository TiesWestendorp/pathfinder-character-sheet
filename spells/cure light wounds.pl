:- multifile spell_school/2.
:- multifile spell_subschool/2.
:- multifile spell_source/3.

spell_school(cure_light_wounds, conjuration).
spell_subschool(cure_light_wounds, healing).
spell_source(cure_light_wounds, Source, Level) :- member(Source-Level, [
  class(alchemist)-1,
  class(bard)-1,
  class(cleric)-1,
  class(oracle)-1,
  class(druid)-1,
  class(inquisitor)-1,
  class(paladin)-1,
  class(ranger)-2,
  class(shaman)-1,
  class(witch)-1,
  domain(healing)-1
]).
