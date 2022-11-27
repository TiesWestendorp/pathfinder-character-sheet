:- multifile spell_school/2.
:- multifile spell_subschool/2.
:- multifile spell_source/3.

spell_school(inflict_serious_wounds, necromancy).
spell_source(inflict_serious_wounds, Source, Level) :- member(Source-Level, [
  class(antipaladin)-4,
  class(cleric)-3,
  class(oracle)-3,
  class(inquisitor)-3,
  class(shaman)-3,
  class(witch)-4
]).

% Casting
spell_casting_time(inflict_serious_wounds, standard_action).
spell_component(inflict_serious_wounds, verbal).
spell_component(inflict_serious_wounds, somatic).

% Effect
spell_range(inflict_serious_wounds, touch).
%spell_target(inflict_serious_wounds, creature_touched). % TODO
spell_duration(inflict_serious_wounds, instantaneous).
spell_saving_throw(inflict_serious_wounds, will, half).
spell_spell_resistance(inflict_serious_wounds, yes).

% Description
spell_description(inflict_serious_wounds, "This spell functions like inflict light wounds, except that you deal 3d8 points of damage + 1 point per caster level (maximum +15).").
