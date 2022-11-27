:- use_module(library(func)).
:- multifile base/2.
:- multifile bonus/3.

armor_class(base).
armor_class(flatfooted) :- \+ class_feature(_, uncanny_dodge).
armor_class(touch).

base(armor_class(Type), 10) :- armor_class(Type).

% Non-flatfooted
bonus(armor_class(Type), dex, Bonus) :-
  Bonus = minlist $ [ability_modifier $ dex, predicate_min $ max_dex_bonus],
  member(Type, [base, touch]).
