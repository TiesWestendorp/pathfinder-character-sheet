:- multifile spell_school/2.
:- multifile spell_descriptor/2.
:- multifile spell_source/3.
:- multifile spell_casting_time/2.
:- multifile spell_component/2.
:- multifile spell_range/2.
:- multifile spell_target/2.
:- multifile spell_duration/2.
:- multifile spell_description/2.
:- multifile spell_saving_throw/3.
:- multifile spell_spell_resistance/2.

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

% Casting
spell_casting_time(doom, standard_action).
spell_component(doom, verbal).
spell_component(doom, somatic).
spell_component(doom, divine_focus).
spell_saving_throw(doom, will, negates).
spell_spell_resistance(doom, yes).

% Effect
spell_range(doom, medium).
%spell_target(doom, living_creature). % TODO
spell_duration(doom, min/level).

% Description
spell_description(doom, "This spell fills a single subject with a feeling of horrible dread that causes it to become shaken.").
