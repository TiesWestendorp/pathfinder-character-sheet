% TODO: Exactly one ability score method must be chosen

:- % Don't spend more than you're allowed, if you're using purchase(_) as ability score method
  ability_score_method(Method),
  (
    Method = roll;
    ability_score_points(Method, Points),
    total_ability_score_cost(Cost),
    (
        Cost > Points,
        throw("Used too many points");
        true
    )
  ).