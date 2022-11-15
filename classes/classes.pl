:- use_module(library(func)).
:- [oracle].
:- [sorcerer].

% Predicates to inspect classes/levels
classes(Classes) :- setof(Class, level(Class), Classes).
class(Class) :- classes(Classes), member(Class, Classes).
level(Class, TotalLevel) :- bagof(_, level(Class), ClassLevels), length(ClassLevels, TotalLevel).
total_level(TotalLevel) :- bagof(Level, Class^level(Class, Level), Levels), sumlist(Levels, TotalLevel).

% Sum progressions to BAB and skill ranks
bonus(skill_ranks, Class, Bonus)       :- Bonus is (level $ Class) * max((ability_modifier $ int) + (skill_ranks_progression $ Class), 0).
bonus(base_attack_bonus, Class, Bonus) :- Bonus is floor((level $ Class)*(base_attack_bonus_progression $ Class)).

% Saving throw progression
base(saving_throw(SavingThrow), 0) :- member(SavingThrow, [fortitude, reflex, will]).
bonus(saving_throw(SavingThrow), Class, Bonus) :-
  level(Class, Level),
  saving_throw_progression(Class, SavingThrows),
  member(SavingThrow-Progression, SavingThrows),
  (  Progression = low,    Bonus is floor(Level/3);
     Progression = medium, Bonus is ceil(Level/2);
     Progression = high,   Bonus is ceil((Level+3)/2)).
