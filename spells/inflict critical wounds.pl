:- multifile spell_school/2.
:- multifile spell_subschool/2.
:- multifile spell_source/3.

spell_school(inflict_critical_wounds, necromancy).
spell_source(inflict_critical_wounds, Source, Level) :- member(Source-Level, [
  class(cleric)-4,
  class(oracle)-4,
  class(inquisitor)-4,
  class(shaman)-4,
  class(witch)-5,
  domain(destruction)-4
]).

% Casting
spell_casting_time(inflict_critical_wounds, standard_action).
spell_component(inflict_critical_wounds, verbal).
spell_component(inflict_critical_wounds, somatic).

% Effect
spell_range(inflict_critical_wounds, touch).
%spell_target(inflict_critical_wounds, creature_touched). % TODO
spell_duration(inflict_critical_wounds, instantaneous).
spell_saving_throw(inflict_critical_wounds, will, half).
spell_spell_resistance(inflict_critical_wounds, yes).

% Description
spell_description(inflict_critical_wounds, "This spell functions like inflict light wounds, except that you deal 4d8 points of damage + 1 point per caster level (maximum +20).").
