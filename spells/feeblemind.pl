:- multifile spell_school/2.
:- multifile spell_descriptor/2.
:- multifile spell_source/3.
:- multifile spell_casting_time/2.
:- multifile spell_component/2.
:- multifile spell_range/2.
:- multifile spell_target/2.
:- multifile spell_duration/2.
:- multifile spell_saving_throw/3.
:- multifile spell_description/2.

spell_school(feeblemind, enchantment(compulsion)).
spell_descriptor(feeblemind, mind-affecting).
spell_source(feeblemind, Source, Level) :- member(Source-Level, [
  class(sorcerer)-5,
  class(wizard)-5,
  class(witch)-5,
  bloodline(aberrant)-5,
  bloodline(accursed)-5,
  mystery(dark_tapestry)-5
]).

% Casting
spell_casting_time(feeblemind, standard_action).
spell_component(feeblemind, verbal).
spell_component(feeblemind, somatic).
spell_component(feeblemind, material("a handful of clay, crystal, or glass spheres")).

% Effect
spell_range(feeblemind, medium).
%spell_target(feeblemind, you). % TODO
spell_duration(feeblemind, instantaneous).
spell_saving_throw(feeblemind, will, negates).

% Description
spell_description(feeblemind, "Target creature's Intelligence and Charisma scores each drop to 1. The affected creature is unable to use Intelligence– or Charisma-based skills, cast spells, understand language, or communicate coherently. Still, it knows who its friends are and can follow them and even protect them. The subject remains in this state until a heal, limited wish, miracle, or wish spell is used to cancel the effect of the feeblemind. A creature that can cast arcane spells, such as a sorcerer or a wizard, takes a -4 penalty on its saving throw.").
