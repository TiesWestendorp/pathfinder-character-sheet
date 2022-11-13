% Bonuses
typed_bonuses_string(Entity, String) :-
  typed_bonuses(Entity, Bonuses),
  maplist(typed_bonus_string, Bonuses, Strings),
  append_bonus_strings(Strings, String).

append_bonus_strings([String], String).
append_bonus_strings([String1, String2 | Strings], String) :-
  append_bonus_strings([String2 | Strings], RemainingString),
  string_concat(String1, ", ", TempString),
  string_concat(TempString, RemainingString, String).

typed_bonus_string(Type-Bonus, String) :-
  term_string(Type, TypeString),
  ( Bonus >= 0,
    number_string(Bonus, NumberString),
    string_concat("+", NumberString, BonusString);
    Bonus < 0,
    number_string(Bonus, BonusString)),
  string_concat(TypeString, " ", TempString),
  string_concat(TempString, BonusString, String).