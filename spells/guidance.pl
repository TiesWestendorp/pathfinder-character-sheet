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

spell_school(guidance, divination).
spell_source(guidance, Source, Level) :- member(Source-Level, [
  class(cleric)-0,
  class(oracle)-0,
  class(druid)-0,
  class(inquisitor)-0,
  class(summoner)-0,
  class(unchained_summoner)-0,
  class(witch)-0,
  elemental_school(void)-0
]).

% Casting
spell_casting_time(guidance, standard_action).
spell_component(guidance, verbal).
spell_component(guidance, somatic).

% Effect
spell_range(guidance, touch).
%spell_target(guidance, creatured_touched). % TODO
spell_duration(guidance, instantaneous).
spell_saving_throw(guidance, will, negates).
spell_spell_resistance(guidance, yes).

% Description
spell_description(guidance, "This spell imbues the subject with a touch of divine guidance.\nThe creature gets a +1 competence bonus on a single attack roll, saving throw, or skill check. It must choose to use the bonus before making the roll to which it applies.").
