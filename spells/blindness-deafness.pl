:- multifile spell_school/2.
:- multifile spell_descriptor/2.
:- multifile spell_source/3.
:- multifile spell_casting_time/2.
:- multifile spell_component/2.
:- multifile spell_range/2.
:- multifile spell_target/2.
:- multifile spell_duration/2.
:- multifile spell_saving_throw/3.
:- multifile spell_spell_resistance/2.
:- multifile spell_description/2.

spell_school(blindness/deafness, necromancy).
spell_descriptor(blindness/deafness, curse).
spell_source(blindness/deafness, Source, Level) :- member(Source-Level, [
  class(antipaladin)-2,
  class(bard)-2,
  class(bloodrager)-2,
  class(cleric)-3,
  class(oracle)-3,
  class(psychic)-2,
  class(shaman)-3,
  class(sorcerer)-2,
  class(wizard)-2,
  class(witch)-2,
  domain(darkness)-2
]).

% Casting
spell_casting_time(blindness/deafness, standard_action).
spell_component(blindness/deafness, verbal).

% Effect
spell_range(blindness/deafness, medium).
%spell_target(blindness/deafness, one_living_creature). % TODO
spell_duration(blindness/deafness, permanent).
spell_saving_throw(blindness/deafness, fortitude, negates).
spell_spell_resistance(blindness/deafness, yes).

% Description
spell_description(blindness/deafness, "You call upon the powers of unlife to render the subject blinded or deafened, as you choose.").
