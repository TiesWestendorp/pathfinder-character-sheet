:- use_module(library(func)).

:- (
     current_predicate(race/1);
     current_predicate(race/2);
     throw("Please choose a race using race/1 or race/2")
   ),
%   [core/dwarf],
%   [core/elf],
%   [core/gnome],
%   [core/halfling],
   [core/human],
   ["traits/ability score modifiers"],
   ["traits/bonus feat"],
   ["traits/halfling luck"],
   ["traits/keen senses"],
   ["traits/skilled"],
   ["traits/sure-footed"].

default_options_list(Default, [], List, [Default | List]).
default_options_list(_, [Option | _], List, List) :- member(Option, List).
default_options_list(Default, [Option | Options], List, default_options_list(Default, Options) $ List) :- \+ member(Option, List).

contains_exactly_one_of([Element | List], Options) :- \+ member(Element, Options), contains_exactly_one_of(List, Options).
contains_exactly_one_of([Element | List], Options) :- member(Element, Options), contains_none_of(List, Options).
contains_none_of([], _).
contains_none_of([Element | List], Options) :- \+ member(Element, Options), contains_none_of(List, Options).