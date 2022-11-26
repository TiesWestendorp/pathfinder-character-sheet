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

spell_school(insanity, enchantment(compulsion)).
spell_descriptor(insanity, mind-affecting).
spell_source(insanity, Source, Level) :- member(Source-Level, [
  class(sorcerer)-7,
  class(wizard)-7,
  class(witch)-7,
  domain(charm)-7,
  domain(madness)-7,
  subdomain(dark_tapestry)-7,
  bloodline(accursed)-7,
  bloodline(div)-7,
  mystery(dark_tapestry)-7,
  mystery(outer_rifts)-7
]).

% Casting
spell_casting_time(insanity, standard_action).
spell_component(insanity, verbal).
spell_component(insanity, somatic).

% Effect
spell_range(insanity, medium).
%spell_target(insanity, one_living_creature). % TODO
spell_duration(insanity, instantaneous).
spell_saving_throw(insanity, will, negates).
spell_spell_resistance(insanity, yes).

% Description
spell_description(insanity, "The affected creature suffers from a continuous confusion effect, as the spell.").
