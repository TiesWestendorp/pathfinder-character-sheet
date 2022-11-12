:- multifile spell_school/2.
:- multifile spell_source/3.
:- multifile annotation/2.

spell_school(entropic_shield, abjuration).
spell_source(entropic_shield, Source, Level) :- member(Source-Level, [
  class(cleric)-1,
  class(oracle)-1,
  class(psychic)-1,
  subdomain(entropy)-1,
  mystery(dark_tapestry)-1
]).

annotation(spell(entropic_shield), _) :- spell_known(entropic_shield, _, _).