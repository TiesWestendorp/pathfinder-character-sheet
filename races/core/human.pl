:- multifile supported/1.
:- multifile size/1.

supported(race(human)).

size(medium) :- race(human).

% TODO:
%bonus(skill_ranks, racial, Level) :- trait(), race(human), total_level(Level).