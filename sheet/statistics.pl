statistics_sheet(X) :-
  phrase(dcg_skills, Skills),
  total_score(base_attack_bonus, Bab),
  X = [
    section(id('statistics'), [
      h3('Statistics'),
      dl([
        div([
          dt('Bab'),
          dd(Bab)
        ]),
        div([
          dt('Skills'),
          dl(id('skills'),
            Skills
          )
        ])
      ])
    ])
  ].

% Skills
dcg_skills --> { bagof(Skill, (Score^(total_score(skill(Skill), Score), ground(Skill))), Skills) }, dcg_skills(Skills).

dcg_skills([]) --> [].
dcg_skills([Skill | Skills]) --> dcg_skill(Skill), dcg_skills(Skills).

dcg_skill(Skill) --> {
    total_score(skill(Skill), Score),
    term_string(Skill, SkillString),
    typed_bonuses_string(skill(Skill), Bonuses),
    number_signed_string(Score, ScoreString)
  }, [
    div(
      id(SkillString),
      [
        dt(SkillString),
        dd(ScoreString),
        dd(class('bonuses'), Bonuses)
      ]
    )
  ].