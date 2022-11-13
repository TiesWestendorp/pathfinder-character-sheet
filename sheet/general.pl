general_sheet(X) :-
  gender(Gender),
  race(Race),
  portrait(Portrait),
  total_score(initiative, Initiative),
  typed_bonuses_string(initiative, InitiativeBonuses),
  total_score(skill(perception), Perception),
  X = [
    section(id('general'), [
      dl([
        span([Gender, Race]),
        div([dt("Initiative"), dd(Initiative), dd(class("bonuses"), InitiativeBonuses)]),
        div([dt("Senses"), dd(0), dt("Perception"), dd(Perception)])
      ]),
      img([id("portrait"), src(Portrait)])
    ])
  ].