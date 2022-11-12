:- multifile spell_school/2.
:- multifile spell_source/3.
:- multifile spell_descriptor/2.

spell_school(doom, necromancy).
spell_descriptor(doom, emotion).
spell_descriptor(doom, fear).
spell_descriptor(doom, mind-affecting).
spell_source(doom, Source, Level) :- member(Source-Level, [
  class(antipaladin)-1,
  class(cleric)-1,
  class(oracle)-1,
  class(inquisitor)-1,
  class(shaman)-1,
  subdomain(chaos(demon))-1,
  subdomain(evil(demon))-1
]).
