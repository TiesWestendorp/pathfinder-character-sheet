:- multifile spell_source/3.

spell_source(feeblemind, Source, Level) :- member(Source-Level, [
  class(sorcerer)-5,
  class(wizard)-5,
  class(witch)-5,
  bloodline(aberrant)-5,
  bloodline(accursed)-5,
  mystery(dark_tapestry)-5
]).