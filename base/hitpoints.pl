:- use_module(library(func)).
:- multifile base/2.
:- multifile bonus/3.

base(hitpoints, 0).
bonus(hitpoints, con, Bonus) :-
  total_level(Level),
  Bonus is Level*(ability_modifier $ con).