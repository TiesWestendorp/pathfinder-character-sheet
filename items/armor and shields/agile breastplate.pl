:- multifile supported/1.
:- multifile bonus/3.
:- multifile slot/1.

supported(equipment(agile_breastplate)).
supported(inventory(agile_breastplate)).

bonus(armor_class(Type), armor, 6) :-
  current_predicate(equipment/1),
  equipment(agile_breastplate),
  member(Type, [base, flatfooted]).

max_dex_bonus(3) :-
  current_predicate(equipment/1),
  equipment(agile_breastplate).

armor_check_penalty(-4) :-
  current_predicate(equipment/1),
  equipment(agile_breastplate).

arcane_spell_failure(1/4) :-
  current_predicate(equipment/1),
  equipment(agile_breastplate).

% TODO: speed

slot(body) :-
  current_predicate(equipment/1),
  equipment(agile_breastplate).

weight(25) :-
  current_predicate(equipment/1),
  equipment(agile_breastplate).
