defense_sheet(X) :-
  total_score(armor_class(base), AC),
  total_score(saving_throw(fortitude), Fortitude),
  total_score(saving_throw(reflex), Reflex),
  total_score(saving_throw(will), Will),
  typed_bonuses_string(armor_class(base), ACBonuses),
  X = [
    section(id('defense'), [
      h3('Defense'),
      dl([
        div(id('armor_class'), [dt('AC'), dd(AC), dd(class('bonuses'), ACBonuses)]),
        div(id('hitpoints'), [dt('HP'), dd(0)]),
        div(id('saving_throws'), [
          dt('Fort'), dd(Fortitude),
          dt('Ref'),  dd(Reflex),
          dt('Will'), dd(Will)
        ]),
        div([dt('Defensive abilities'), dd('-')]),
        div([dt('Immunities'), dd('-')])
      ])
    ])
  ].