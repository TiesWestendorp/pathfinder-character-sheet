:- multifile spell_source/3.

spell_source(entropic_shield, Source, Level) :- member(Source-Level, [
  class(cleric)-1,
  class(oracle)-1,
  class(psychic)-1,
  subdomain(entropy)-1,
  mystery(dark_tapestry)-1
]).
