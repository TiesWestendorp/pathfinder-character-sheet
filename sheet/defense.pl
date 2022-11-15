defense --> {
    phrase(dcg_armor_classes, ArmorClasses),
    phrase(dcg_saving_throws, SavingThrows)
  },
  [
    section(id('defense'), [
      h3('Defense'),
      dl([
        div(id('armor_class'), ArmorClasses),
        div(id('hitpoints'), [dt('HP'), dd(0)]),
        div(id('saving_throws'), SavingThrows),
        div([dt('Defensive abilities'), dd('-')]),
        div([dt('Immunities'), dd('-')])
      ])
    ])
  ].

% Armor classes
dcg_armor_classes --> dcg_armor_classes([base, flatfooted, touch]).
dcg_armor_classes([]) --> [].
dcg_armor_classes([ ArmorClass | ArmorClasses ]) --> dcg_entity(armor_class(ArmorClass), unsigned), dcg_armor_classes(ArmorClasses).

% Saving throws
dcg_saving_throws --> dcg_saving_throws([fortitude, reflex, will]).
dcg_saving_throws([]) --> [].
dcg_saving_throws([ SavingThrow | SavingThrows ]) --> dcg_entity(saving_throw(SavingThrow), signed), dcg_saving_throws(SavingThrows).
