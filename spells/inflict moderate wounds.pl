:- multifile spell_school/2.
:- multifile spell_subschool/2.
:- multifile spell_source/3.

spell_school(inflict_moderate_wounds, necromancy).
spell_source(inflict_moderate_wounds, Source, Level) :- member(Source-Level, [
  class(antipaladin)-3,
  class(cleric)-2,
  class(oracle)-2,
  class(inquisitor)-2,
  class(shaman)-2,
  class(witch)-2
]).

% Casting
spell_casting_time(inflict_moderate_wounds, standard_action).
spell_component(inflict_moderate_wounds, verbal).
spell_component(inflict_moderate_wounds, somatic).

% Effect
spell_range(inflict_moderate_wounds, touch).
%spell_target(inflict_moderate_wounds, creature_touched). % TODO
spell_duration(inflict_moderate_wounds, instantaneous).
spell_saving_throw(inflict_moderate_wounds, will, half).
spell_spell_resistance(inflict_moderate_wounds, yes).

% Description
spell_description(inflict_moderate_wounds, "This spell functions like inflict light wounds, except that you deal 2d8 points of damage + 1 point per caster level (maximum +10).").
