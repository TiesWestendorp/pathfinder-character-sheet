:- multifile spell_source/3.

spell_source(planar_binding, Source, Level) :- member(Source-Level, [
  class(sorcerer)-6,
  class(wizard)-6,
  class(summoner)-5,
  class(unchained_summoner)-6,
  domain(void)-6,
  subdomain(aeon)-6,
  subdomain(daemon)-6,
  subdomain(chaos(demon))-6,
  subdomain(chaos(devil))-6,
  subdomain(evil(demon))-6,
  subdomain(evil(devil))-6,
  subdomain(inevitable)-6,
  subdomain(protean)-6,
  bloodline(efreeti)-6,
  elemental_school(air)-6,
  elemental_school(earth)-6,
  elemental_school(fire)-6,
  elemental_school(water)-6,
  mystery(dark_tapestry)-6,
  mystery(outer_rifts)-6
]).