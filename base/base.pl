:- [ability_score_purchase].
:- [ability_scores].
:- [armor_class].
:- [base_attack_bonus].
:- [combat_maneuver_bonus].
:- [combat_maneuver_defense].
:- [favored_class_bonus].
:- [hitpoints].
:- [initiative].
:- [saving_throws].
:- [size].
:- [skills].

predicate_count(Functor, Count) :- atom(Functor), Count = length $ bagof(Term) $ Term^Predicate^(Predicate=..[Functor, Term], Predicate).
predicate_count(Predicate, Count) :- \+ atom(Predicate), Count = length $ bagof(_) $ Predicate.
%predicate_count(Function, Sum) :- Sum = length $ bagof(Term) $ call(Function, Term).
predicate_sum(Function, Sum) :- Sum = sumlist $ bagof(Term) $ call(Function, Term).
predicate_max(Function, Max) :- Max = maxlist $ bagof(Term) $ call(Function, Term).
predicate_min(Function, Min) :- Min = minlist $ bagof(Term) $ call(Function, Term).

maxlist([Number], Number).
maxlist([X | Xs], Max) :- maxlist(Xs, Max0), (Max0 > X, Max = Max0; Max0 =< X, Max = X).

minlist([Number], Number).
minlist([X | Xs], Max) :- minlist(Xs, Max0), (Max0 > X, Max = X; Max0 =< X, Max = Max0).

% TODO: allow stacking bonuses
stacking_bonuses([circumstance, dodge, untyped]).

filter_typed_bonuses([], _{}).
filter_typed_bonuses([Type-Bonus | Rest], Filtered) :-
  filter_typed_bonuses(Rest, FilteredRest),
  Maximum is max(FilteredRest.get(Type, -inf), Bonus),
  Filtered = FilteredRest.put(Type, Maximum).

typed_bonuses(Entity, TypedBonuses) :-
  bagof(Type-Bonus, bonus(Entity, Type, Bonus), UnfilteredBonuses),
  filter_typed_bonuses(UnfilteredBonuses, FilteredBonusesDict),
  bagof(Type-Bonus, FilteredBonusesDict.get(Type) = Bonus, TypedBonuses);
  \+ bonus(Entity, _, _), TypedBonuses = [].

bonuses(Entity, Bonuses) :- Bonuses = pairs_keys_values(typed_bonuses $ Entity) $ _.

total_score(Entity, Score) :- Score is (base $ Entity) + (sumlist $ bonuses $ Entity).

combat_maneuvers([
  bull_rush,
  dirty_trick,
  disarm,
  drag,
  grapple,
  overrun,
  reposition,
  steal,
  sunder,
  trip
]).

:- multifile max_dex_bonus/1.
max_dex_bonus(inf).