:- multifile spell_school/2.
:- multifile spell_source/3.

spell_school(black_tentacles, conjuration(creation)).
spell_source(black_tentacles, Source, Level) :- member(Source-Level, [
  class(bloodrager)-4,
  class(magus)-4,
  class(sorcerer)-4,
  class(wizard)-4,
  class(summoner)-3,
  class(unchained_summoner)-4,
  class(witch)-4,
  bloodline(aberrant)-4,
  mystery(dark_tapestry)-4
]).