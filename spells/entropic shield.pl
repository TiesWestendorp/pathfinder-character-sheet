:- multifile spell_school/2.
:- multifile spell_source/3.
:- multifile spell_casting_time/2.
:- multifile spell_component/2.
:- multifile spell_range/2.
:- multifile spell_target/2.
:- multifile spell_duration/2.
:- multifile spell_description/2.

spell_school(entropic_shield, abjuration).
spell_source(entropic_shield, Source, Level) :- member(Source-Level, [
  class(cleric)-1,
  class(oracle)-1,
  class(psychic)-1,
  subdomain(entropy)-1,
  mystery(dark_tapestry)-1
]).

% Casting
spell_casting_time(entropic_shield, standard_action).
spell_component(entropic_shield, verbal).
spell_component(entropic_shield, somatic).

% Effect
spell_range(entropic_shield, personal).
spell_target(entropic_shield, you).
spell_duration(entropic_shield, min/level).

% Description
spell_description(entropic_shield, "A magical field appears around you, glowing with a chaotic blast of multicolored hues. This field deflects incoming arrows, rays, and other ranged attacks. Each ranged attack directed at you for which the attacker must make an attack roll has a 20% miss chance (similar to the effects of concealment). Other attacks that simply work at a distance are not affected.").
