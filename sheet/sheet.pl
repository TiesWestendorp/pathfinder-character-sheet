:- initialization(main, main).
:- use_module(library(http/html_write)).

:- [helpers].
:- [general].
:- [defense].
:- [offense].
:- [statistics].
:- [special_abilities].

character_sheet(
    page(
        % Head
        [
          title(Name),
          link([rel("stylesheet"), href("style.css")])
        ],
        % Body
        Body
    )
) :- 
  name(Name),
  Header = [
    h1(Name)
  ],
  general_sheet(General),
  phrase(defense, Defense),
  phrase(offense, Offense),
  statistics_sheet(Statistics),
  special_abilities_sheet(SpecialAbilities),
  append(Header, General, Temp0),
  append(Temp0, Defense, Temp1),
  append(Temp1, Offense, Temp2),
  append(Temp2, Statistics, Temp3),
  append(Temp3, SpecialAbilities, Body).
