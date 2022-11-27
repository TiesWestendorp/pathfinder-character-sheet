:- multifile spell_school/2.
:- multifile spell_subschool/2.
:- multifile spell_source/3.

spell_school(cure_critical_wounds, conjuration).
spell_subschool(cure_critical_wounds, healing).
spell_source(cure_critical_wounds, Source, Level) :- member(Source-Level, [
  class(alchemist)-4,
  class(bard)-4,
  class(cleric)-4,
  class(oracle)-4,
  class(druid)-5,
  class(inquisitor)-4,
  class(shaman)-4,
  class(witch)-5,
  domain(healing)-4
]).
