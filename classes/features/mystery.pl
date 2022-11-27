:- multifile supported/1.

supported(feature(mystery)).
supported(mystery(Mystery)) :- member(Mystery, [
  apocalypse,
  ascetic,
  battle,
  bones,
  dragon,
  elemental,
  flame,
  godclaw,
  heavens,
  intrigue,
  juju,
  life,
  lore,
  lunar,
  metal,
  nature,
  occult,
  outer_rifts,
  reaper,
  shadow,
  solar,
  spellscar,
  stone,
  streets,
  succor,
  time,
  volcano,
  waves,
  whimsy,
  wind,
  winter,
  wood
]).

:- [mysteries/ancestor].
:- ["mysteries/dark tapestry"].