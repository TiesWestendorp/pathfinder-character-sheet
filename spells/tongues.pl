:- multifile spell_school/2.
:- multifile spell_source/3.

spell_school(tongues, divination).
spell_source(tongues, Source, Level) :- member(Source-Level, [
  class(alchemist)-3,
  class(bard)-2,
  class(cleric)-4,
  class(oracle)-4,
  class(inquisitor)-2,
  class(medium)-2,
  class(mesmerist)-2,
  class(psychic)-3,
  class(shaman)-4,
  class(sorcerer)-3,
  class(wizard)-3,
  class(spiritualist)-3,
  class(summoner)-3,
  class(unchained_summoner)-3,
  class(witch)-3,
  subdomain(agathion)-3,
  subdomain(language)-3,
  bloodline(aberrant)-3,
  elemental_school(wood)-3,
  mystery(dark_tapestry)-3,
  mystery(lore)-2
]).
