statistics_sheet(X) :-
  phrase(dcg_abilities, Abilities),
  phrase(dcg_skills, Skills),
  Bab = total_score $ base_attack_bonus,
  UsedSkillRanks = predicate_count $ skill_rank,
  phrase(dcg_entity(skill_ranks, unsigned, no_title), AllowedSkillRanks),
  X = [
    section(id('statistics'), [
      h3('Statistics'),
      div(dl(id('abilities'), Abilities)),
      dl(
        div([
          dt('Bab'),
          dd(Bab)
        ])
      ),
      div(UsedSkillRanks),
      div(AllowedSkillRanks),
      dl(id('skills'),
        Skills
      )
    ])
  ].

dcg_abilities --> { bagof(Ability, (Score^(total_score(ability(Ability), Score), ground(Ability))), Abilities) }, dcg_abilities(Abilities).
dcg_abilities([]) --> [].
dcg_abilities([Skill | Skills]) --> dcg_entity(ability(Skill), unsigned, title), dcg_abilities(Skills).


% Skills
dcg_skills --> { bagof(Skill, (Score^(total_score(skill(Skill), Score), ground(Skill))), Skills) }, dcg_skills(Skills).

dcg_skills([]) --> [].
dcg_skills([Skill | Skills]) --> dcg_entity(skill(Skill), signed, title), dcg_skills(Skills).
