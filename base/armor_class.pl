:- use_module(library(func)).
:- multifile base/2.
:- multifile bonus/3.

armor_class(base).
armor_class(flatfooted) :- \+ feat(uncanny_dodge).
armor_class(touch).

base(armor_class(Type), ArmorClass) :-
  size_modifier(SizeModifier),
  ArmorClass is 10 + SizeModifier,
  armor_class(Type).

% Non-flatfooted
bonus(armor_class(Type), dex, ability_modifier $ dex) :-
  % TODO: consider max dex bonus
  member(Type, [base, touch]).
