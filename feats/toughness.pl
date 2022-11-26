:- multifile supported/1.
:- multifile bonus/3.

supported(feat(toughness)).

% TODO: hit die instead of level
bonus(hitpoints, toughness, BonusHitpoints) :-
  feat(toughness),
  total_level(Level),
  BonusHitpoints is max(3, Level).
