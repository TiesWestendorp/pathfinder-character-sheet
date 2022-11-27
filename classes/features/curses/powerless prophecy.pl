:- multifile bonus/3.

class_feature(Class, uncanny_dodge) :- class_feature(Class, oracles_curse(powerless_prophecy)).

bonus(initiative, insight, 4) :-
  class_feature(Class, oracles_curse(powerless_prophecy)),
  level(Class, Level), % TODO: add 1/2 * other class levels and hit die
  Level >= 5.

class_feature(Class, improved_uncanny_dodge) :-
  class_feature(Class, oracles_curse(powerless_prophecy)),
  level(Class, Level), % TODO: add 1/2 * other class levels and hit die
  Level >= 10.

% TODO: 15th level bonus
%bonus(saving_throw(_), insight, 4) :-
