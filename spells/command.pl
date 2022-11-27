:- multifile spell_school/2.
:- multifile spell_subschool/2.
:- multifile spell_source/3.
:- multifile spell_descriptor/2.

spell_school(command, enchantment).
spell_subschool(command, compulsion).
spell_descriptor(command, language-dependent).
spell_descriptor(command, mind-affecting).
spell_source(command, Source, Level) :- member(Source-Level, [
  class(antipaladin)-1,
  class(cleric)-1,
  class(oracle)-1,
  class(inquisitor)-1,
  class(psychic)-1,
  class(witch)-1,
  subdomain(evil(devil))-1,
  subdomain(evil(law))-1,
  subdomain(toil)-1,
  subdomain(tyranny)-1
]).
