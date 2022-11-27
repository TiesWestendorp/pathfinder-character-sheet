:- multifile spell_school/2.
:- multifile spell_subschool/2.
:- multifile spell_source/3.

spell_school(cure_serious_wounds, conjuration).
spell_subschool(cure_serious_woudns, healing).
spell_source(cure_serious_wounds, Source, Level) :- member(Source-Level, [
  class(alchemist)-3,
  class(bard)-3,
  class(cleric)-3,
  class(oracle)-3,
  class(druid)-4,
  class(inquisitor)-3,
  class(paladin)-4,
  class(ranger)-4,
  class(shaman)-3,
  class(witch)-4,
  domain(healing)-3
]).
