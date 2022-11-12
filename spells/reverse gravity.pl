:- multifile spell_school/2.
:- multifile spell_source/3.

spell_school(reverse_gravity, transmutation).
spell_source(reverse_gravity, Source, Level) :- member(Source-Level, [
  class(druid)-8,
  class(sorcerer)-7,
  class(wizard)-7,
  domain(void)-7,
  elemental_school(earth)-7,
  mystery(dark_tapestry)-8
]).