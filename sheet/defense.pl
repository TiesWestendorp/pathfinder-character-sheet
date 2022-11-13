defense --> {
    total_score(armor_class(base), AC),
    phrase(dcg_saving_throws, SavingThrows),
    typed_bonuses_string(armor_class(base), ACBonuses)
  },
  [
    section(id('defense'), [
      h3('Defense'),
      dl([
        div(id('armor_class'), [dt('AC'), dd(AC), dd(class('bonuses'), ACBonuses)]),
        div(id('hitpoints'), [dt('HP'), dd(0)]),
        div(id('saving_throws'), SavingThrows),
        div([dt('Defensive abilities'), dd('-')]),
        div([dt('Immunities'), dd('-')])
      ])
    ])
  ].

% Saving throws
dcg_saving_throws --> dcg_saving_throws([fortitude, reflex, will]).
dcg_saving_throws([]) --> [].
dcg_saving_throws([ SavingThrow | SavingThrows ]) --> dcg_saving_throw(SavingThrow), dcg_saving_throws(SavingThrows).

dcg_saving_throw(SavingThrow) --> {
    total_score(saving_throw(SavingThrow), Score),
    number_signed_string(Score, ScoreString),
    typed_bonuses_string(saving_throw(SavingThrow), Bonuses)
  }, [
    dt(SavingThrow),
    dd(ScoreString),
    dd(class('bonuses'), Bonuses)
  ].
dcg_saving_throw(SavingThrow) --> { \+ total_score(saving_throw(SavingThrow), _) }.