:- multifile spell_school/2.
:- multifile spell_subschool/2.
:- multifile spell_source/3.
:- multifile spell_descriptor/2.

spell_school(murderous_command, enchantment).
spell_subschool(murderous_command, compulsion).
spell_descriptor(murderous_command, mind-affecting).
spell_source(murderous_command, Source, Level) :- member(Source-Level, [
  class(antipaladin)-1,
  class(cleric)-1,
  class(oracle)-1,
  class(psychic)-1,
  subdomain(hatred)-1
]).
