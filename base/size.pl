:- use_module(library(func)).
:- multifile bonus/3.

size_class(Size, Class) :-
  Size = fine, Class = -4;
  Size = diminutive, Class = -3;
  Size = tiny, Class = -2;
  Size = small, Class = -1;
  Size = medium, Class = 0;
  Size = large, Class = 1;
  Size = huge, Class = 2;
  Size = gargantuan, Class = 3;
  Size = colossal, Class = 4.
size_class(Class) :- size(Size), size_class(Size, Class).

size_modifier(Size, Modifier) :-
  size_class(Size, Class),
  ( Class < 0, Modifier is 2^(-Class-1);
    Class == 0, Modifier = 0;
    Class > 0, Modifier is -(2^(Class-1))).
size_modifier(Modifier) :- size(Size), size_modifier(Size, Modifier).

special_size_modifier(Size, Modifier) :- Modifier is -(size_modifier $ Size).
special_size_modifier(Modifier) :- size(Size), special_size_modifier(Size, Modifier).

% Size bonuses
bonus(attack(_), size, Bonus)                  :- size_modifier(Bonus).
bonus(armor_class(_), size, Bonus)             :- size_modifier(Bonus).
bonus(combat_maneuver_bonus(_), size, Bonus)   :- special_size_modifier(Bonus).
bonus(combat_maneuver_defense(_), size, Bonus) :- special_size_modifier(Bonus).
bonus(skill(fly), size, Bonus)                 :- size_class(SizeClass), Bonus is -2 * SizeClass.
bonus(skill(stealth), size, Bonus)             :- size_class(SizeClass), Bonus is -4 * SizeClass.

% TODO: Space