statistics_sheet(X) :-
  bagof(div(id(Skill), [dd(Skill), dd(Score), dd(Bonuses)]), (total_score(skill(Skill), Score), typed_bonuses(Skill, Bonuses)), Skills),
  total_score(base_attack_bonus, Bab),
  X = [
    section(id('statistics'), [
      h3('Statistics'),
      dl(
        div([
          dt('Bab'),
          dd(Bab)
        ]),
        div(
          dl(
            Skills
          )
        )
      ),
    ])
  ].