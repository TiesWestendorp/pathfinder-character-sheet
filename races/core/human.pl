:- multifile supported/1.
:- multifile size/1.
:- multifile language/1.
:- multifile racial_trait/1.

supported(race(human, _)).

language(common) :- race(human, _).

% Racial traits
racial_trait(size(medium)) :- race(human, _).
racial_trait(speed(30)) :- race(human, _).
racial_trait(Trait) :-
  race(human, Traits),
  member(Trait,
    default_options_list(ability_score_modifiers(_), [ability_score_modifiers(_), alchemically_enchanced, dual_talent, eye_for_talent]) $
    default_options_list(skilled, [skilled, aquatic_ancestry, comprehensive_education, dimdweller, dual_talent, fey_magic, frontier_survivor, giant_ancestry, heart_of_the_fields, heart_of_the_mountains, heart_of_the_sea, heart_of_the_slums, heart_of_the_snows, heart_of_the_streets, heart_of_the_sun, heart_of_the_wilderness, history_of_terrors, imposter-wary, industrious, innovative, institutional_memory, one_of_the_multitude, poison_minion, practiced_hunter, silver_tongued, social_ties, wayfarer]) $
    default_options_list(bonus_feat, [bonus_feat, adoptive_parentage, alchemically_enchanced, awareness, dragon_scholar, dual_talent, eye_for_talent, focused_study, heroic, military_tradition, mixed_heritage, piety, psychic_defense, rationalize, reptilian_ancestry, self-made_fate, shadowhunter, unstoppable_magic]) $
    Traits
  ).

% Favored class bonuses
% TODO