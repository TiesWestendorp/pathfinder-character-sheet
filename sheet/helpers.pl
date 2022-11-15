:- use_module(library(func)).

% Entity tags
dcg_entity(Entity, Signed) --> {
    (
      Signed = signed,   ScoreString = number_signed_string $ total_score $ Entity;
      Signed = unsigned, ScoreString = number_string $ total_score $ Entity
    ),
    (
      Bonuses = typed_bonuses_string $ Entity;
      \+ bonus(Entity, _, _), Bonuses = "none"
    ),
    Title = term_formatted $ Entity,
    Tooltip = string_concat(string_concat(Title) $ " bonuses: ") $ Bonuses
  },
  [
    div([id(Title), title(Tooltip)], [dt(Title), dd(ScoreString)])
  ].
dcg_entity(Entity, _) --> { \+ total_score(Entity, _) }.

% Helpers
typed_bonuses_string(Entity, String) :- 
  String = comma_separated_strings $ maplist(typed_bonus_string) $ typed_bonuses $ Entity.

term_formatted(Original, Replaced) :- Replaced = underscore_space $ term_string $ strip_first_functor $ Original.

underscore_space(Original, Replaced) :- string_replace(Original, "_", " ", Replaced).

string_replace(Original, Source, Target, Replaced) :-
  Replaced = atomics_to_string(split_string(Original, Source) $ "") $ Target.

comma_separated_strings([String], String).
comma_separated_strings([String1, String2 | Strings], String) :-
  String = string_concat(string_concat(String1) $ ", ") $ comma_separated_strings $ [String2 | Strings].

typed_bonus_string(Type-Bonus, String) :-
  String = string_concat(string_concat(term_formatted $ Type) $ " ") $ number_signed_string $ Bonus.

number_signed_string(Number, string_concat("+") $ number_string $ Number) :- Number >= 0.
number_signed_string(Number, number_string $ Number) :- Number < 0.

strip_first_functor(Predicate, Predicate) :- atom(Predicate).
strip_first_functor(Predicate, Term) :- Predicate =.. [_ | Arguments], member(Term, Arguments).
