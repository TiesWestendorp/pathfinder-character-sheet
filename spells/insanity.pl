:- multifile spell_source/3.

spell_source(planar_binding, Source, Level) :- member(Source-Level, [
  class(sorcerer)-7,
  class(wizard)-7,
  class(witch)-7,
  domain(charm)-7,
  domain(madness)-7,
  subdomain(dark_tapestry)-7,
  bloodline(accursed)-7,
  bloodline(div)-7,
  mystery(dark_tapestry)-7,
  mystery(outer_rifts)-7
]).