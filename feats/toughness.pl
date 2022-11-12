:- multifile supported/1.
:- multifile bonus/3.

supported(feat(toughness)).

% TODO: hit die instead of level
bonus(hit_points, feat(toughness), BonusHitpoints) :-
  feat(toughness),
  total_level(Level),
  BonusHitpoints is max(3, Level).
