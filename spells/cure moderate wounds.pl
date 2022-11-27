:- multifile spell_school/2.
:- multifile spell_subschool/2.
:- multifile spell_source/3.

spell_school(cure_moderate_wounds, conjuration).
spell_subschool(cure_moderate_wounds, healing).
spell_source(cure_moderate_wounds, Source, Level) :- member(Source-Level, [
  class(alchemist)-2,
  class(bard)-2,
  class(cleric)-2,
  class(oracle)-2,
  class(druid)-3,
  class(inquisitor)-2,
  class(paladin)-3,
  class(ranger)-3,
  class(shaman)-2,
  class(witch)-2,
  domain(healing)-2
]).
