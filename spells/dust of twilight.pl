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

spell_school(dust_of_twilight, conjuration).
spell_descriptor(dust_of_twilight, darkness).
spell_source(dust_of_twilight, Source, Level) :- member(Source-Level, [
  class(bard)-2,
  class(bloodrager)-2,
  class(sorcerer)-2,
  class(wizard)-2,
  mystery(dark_tapestry)-2,
  mystery(lunar)-2
]).

% Casting
spell_casting_time(dust_of_twilight, standard_action).
spell_component(dust_of_twilight, verbal).
spell_component(dust_of_twilight, somatic).
spell_component(dust_of_twilight, material("coal dust")).
spell_saving_throw(dust_of_twilight, fortitude, negates).
spell_spell_resistance(dust_of_twilight, no).

% Effect
spell_range(dust_of_twilight, medium).
%spell_target(dust_of_twilight, you). % TODO
spell_duration(dust_of_twilight, instantaneous).

% Description
spell_description(dust_of_twilight, "A shower of iridescent black particles clings to and extinguishes torches, lanterns, sunrods, and similar mundane light sources and dispels any spell of 2nd level or lower with the light descriptor (as dispel magic). Creatures in the area must make a Fortitude save or become fatigued.").
