:- multifile spell_school/2.
:- multifile spell_source/3.
:- multifile spell_descriptor/2.

spell_school(insanity, enchantment(compulsion)).
spell_descriptor(insanity, mind-affecting).
spell_source(insanity, Source, Level) :- member(Source-Level, [
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
