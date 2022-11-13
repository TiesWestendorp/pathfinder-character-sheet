:- multifile bonus/3.

bonus(saving_throw(fortitude), con, Bonus) :- ability_modifier(con, Bonus).
bonus(saving_throw(reflex), dex, Bonus) :- ability_modifier(dex, Bonus).
bonus(saving_throw(will), wis, Bonus) :- ability_modifier(wis, Bonus).