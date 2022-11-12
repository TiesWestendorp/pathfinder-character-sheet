:- initialization(main, main).
:- use_module(library(http/html_write)).

character_sheet(
    page(
        % Head
        [title('Character Sheet')],
        % Body
        [
            h1('Character sheet'),
            p('Bla')
        ]
    )
).

main :-
    character_sheet(X),
    phrase(X, Y),
    (   current_prolog_flag(argv, [File|_])
    ->  setup_call_cleanup(open(File, write, Out),
            print_html(Out, Y),
            close(Out))
    ;   print_html(Y)
    ).