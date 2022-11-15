:- [ability_score_purchase].
:- [ability_scores].
:- [armor_class].
:- [base_attack_bonus].
:- [combat_maneuver_bonus].
:- [combat_maneuver_defense].
:- [favored_class_bonus].
:- [initiative].
:- [saving_throws].
:- [size].
:- [skills].

predicate_count(Predicate, Count) :- Count = length $ bagof(_) $ Predicate.
predicate_sum(Functor, Sum) :- Sum = sumlist $ bagof(Term) $ (Predicate=..[Functor, Term], Predicate).

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

base(hitpoints, 0).