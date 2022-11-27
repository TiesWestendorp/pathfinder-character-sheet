:- multifile spell_school/2.
:- multifile spell_subschool/2.
:- multifile spell_source/3.

spell_school(stabilize, conjuration).
spell_subschool(stabilize, healing).
spell_source(stabilize, Source, Level) :- member(Source-Level, [
  class(cleric)-0,
  class(oracle)-0,
  class(druid)-0,
  class(inquisitor)-0,
  class(psychic)-0,
  class(witch)-0
]).
