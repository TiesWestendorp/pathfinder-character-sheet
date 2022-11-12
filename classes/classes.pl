:- [oracle].
:- [sorcerer].

classes(Classes) :- setof(Class, level(Class), Classes).
class(Class) :- classes(Classes), member(Class, Classes).
level(Class, TotalLevel) :- bagof(Class, level(Class), ClassLevels), length(ClassLevels, TotalLevel).
total_level(TotalLevel) :- bagof(Level, Class^level(Class, Level), Levels), sumlist(Levels, TotalLevel).