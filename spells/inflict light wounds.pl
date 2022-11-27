:- multifile spell_school/2.
:- multifile spell_subschool/2.
:- multifile spell_source/3.

spell_school(inflict_light_wounds, necromancy).
spell_source(inflict_light_wounds, Source, Level) :- member(Source-Level, [
  class(antipaladin)-1,
  class(cleric)-1,
  class(oracle)-1,
  class(inquisitor)-1,
  class(shaman)-1,
  class(witch)-1
]).

% Casting
spell_casting_time(inflict_light_wounds, standard_action).
spell_component(inflict_light_wounds, verbal).
spell_component(inflict_light_wounds, somatic).

% Effect
spell_range(inflict_light_wounds, touch).
%spell_target(inflict_light_wounds, creature_touched). % TODO
spell_duration(inflict_light_wounds, instantaneous).
spell_saving_throw(inflict_light_wounds, will, half).
spell_spell_resistance(inflict_light_wounds, yes).

% Description
spell_description(inflict_light_wounds, "When laying your hand upon a creature, you channel negative energy that deals 1d8 points of damage + 1 point per caster level (maximum +5).\nSince undead are powered by negative energy, this spell cures such a creature of a like amount of damage, rather than harming it.").
