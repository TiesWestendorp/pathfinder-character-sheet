:- multifile spell_school/2.
:- multifile spell_source/3.

spell_school(abjuration).
spell_source(shield_of_faith, Source, Level) :- member(Source-Level, [
  class(cleric)-1,
  class(oracle)-1,
  class(inquisitor)-1,
  domain(glory)-1,
  subdomain(agathion)-1
]).