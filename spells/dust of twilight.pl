:- multifile spell_school/2.
:- multifile spell_source/3.
:- multifile spell_descriptor/2.

spell_school(dust_of_twilight, conjuration).
spell_descriptor(dust_of_twilight, darkness).
spell_source(dust_of_twilight, Source, Level) :- member(Source-Level, [
  class(bard)-2,
  class(bloodrager)-2,
  class(sorcerer)-2,
  class(wizard)-2,
  mystery(dark_tapestry)-2,
  mystery(lunar)-2
]).