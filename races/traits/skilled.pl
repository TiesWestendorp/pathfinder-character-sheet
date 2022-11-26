:- multifile supported/1.
:- multifile bonus/3.

supported(racial_trait(skilled)).

bonus(skill_ranks, skilled, Level) :- racial_trait(skilled), total_level(Level). % TODO: make origin racial_trait(skilled)