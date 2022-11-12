:- multifile spell_school/2.
:- multifile spell_source/3.

spell_school(liberating_command, transmutation).
spell_source(liberating_command, Source, Level) :- member(Source-Level, [
  class(bard)-1,
  class(cleric)-1,
  class(oracle)-1,
  class(druid)-1,
  class(paladin)-1,
  class(psychic)-1,
  class(ranger)-1,
  class(sorcerer)-1,
  class(wizard)-1
]).
