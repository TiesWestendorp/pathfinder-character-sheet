statistics_sheet(X) :-
  phrase(dcg_skills, Skills),
  total_score(base_attack_bonus, Bab),
  X = [
    section(id('statistics'), [
      h3('Statistics'),
      dl(
        div([
          dt('Bab'),
          dd(Bab)
        ])
      ),
      dl(id('skills'),
        Skills
      )
    ])
  ].

% Skills
dcg_skills --> { bagof(Skill, (Score^(total_score(skill(Skill), Score), ground(Skill))), Skills) }, dcg_skills(Skills).

dcg_skills([]) --> [].
dcg_skills([Skill | Skills]) --> dcg_entity(skill(Skill), signed), dcg_skills(Skills).
