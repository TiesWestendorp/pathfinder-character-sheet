:- multifile spell_source/3.

spell_source(interplanetary_teleport, Source, Level) :- member(Source-Level, [
  class(cleric)-9,
  class(oracle)-9,
  class(sorcerer)-9,
  class(wizard)-9,
  domain(void)-9,
  mystery(dark_tapestry)-9
]).