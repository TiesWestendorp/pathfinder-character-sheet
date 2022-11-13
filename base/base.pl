:- [ability_score_purchase].
:- [ability_scores].
:- [armor_class].
:- [base_attack_bonus].
:- [combat_maneuver_bonus].
:- [combat_maneuver_defense].
:- [favored_class_bonus].
:- [initiative].
:- [size].
:- [skills].

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

bonuses(Entity, Bonuses) :-
  typed_bonuses(Entity, TypedBonuses),
  pairs_keys_values(TypedBonuses, _, Bonuses).

total_score(Entity, Score) :-
  base(Entity, Base),
  bonuses(Entity, Bonuses),
  sumlist(Bonuses, SummedBonuses),
  Score is Base + SummedBonuses.

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
