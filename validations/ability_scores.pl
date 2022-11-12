% TODO: undead don't have CON
% TODO: mindless creature don't have INT
:- % Each ability has exactly one base
  (
    member(Ability, [str, dex, con, int, wis, cha]),
    (
      \+ base(ability(Ability), _),
      atom_string(Ability, AbilityString),
      string_concat("Missing `base(ability(", AbilityString, Str0),
      string_concat(Str0, ", X)).` for some integer X.", Error),
      throw(Error);
      bagof(base(ability(Ability, Score)), base(ability(Ability), Score), Scores),
      length(Scores, Amount),
    
      % TODO: generate proper error
      print(Ability),
      print(Scores),
      (
        Amount > 1, throw("Multiple scores specified for ability");
        false
      )
    )
  ); true.