:- multifile supported/1.

supported(ability_score_method(Method)) :- member(Method, [
  roll,
  purchase(low_fantasy),
  purchase(standard_fantasy),
  purchase(high_fantasy),
  purchase(epic_fantasy)
]).

total_ability_score_cost(Cost) :-
  bagof(Cost, Ability^Score^(
    base(ability(Ability), Score),
    ability_score_cost(Score, Cost)
  ), Costs),
  sumlist(Costs, Cost).

ability_score_cost(7,  -4).
ability_score_cost(8,  -2).
ability_score_cost(9,  -1).
ability_score_cost(10, 0).
ability_score_cost(11, 1).
ability_score_cost(12, 2).
ability_score_cost(13, 3).
ability_score_cost(14, 5).
ability_score_cost(15, 7).
ability_score_cost(16, 10).
ability_score_cost(17, 13).
ability_score_cost(18, 17).

ability_score_points(purchase(low_fantasy), 10).
ability_score_points(purchase(standard_fantasy), 15).
ability_score_points(purchase(high_fantasy), 20).
ability_score_points(purchase(epic_fantasy), 25).

% Basic NPCs: The ability scores for a basic NPC are: 13, 12, 11, 10, 9, and 8.
% Heroic NPCs: The ability scores for a heroic NPC are: 15, 14, 13, 12, 10, and 8.