statistics_sheet(X) :-
  phrase(dcg_skills, Skills),
  Bab = total_score $ base_attack_bonus,
  UsedSkillRanks = predicate_count $ A^skill_rank(A),
  phrase(dcg_entity(skill_ranks, unsigned, no_title), AllowedSkillRanks),
  X = [
    section(id('statistics'), [
      h3('Statistics'),
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

% Skills
dcg_skills --> { bagof(Skill, (Score^(total_score(skill(Skill), Score), ground(Skill))), Skills) }, dcg_skills(Skills).

dcg_skills([]) --> [].
dcg_skills([Skill | Skills]) --> dcg_entity(skill(Skill), signed, title), dcg_skills(Skills).
