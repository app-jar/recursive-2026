is_operator(+).
is_operator(-).
is_operator(*).
is_operator(/).

valid_postfix(Tokens) :-
    valid_postfix(Tokens, 0, Count),
    Count =:= 1.

valid_postfix([], Count, Count).

valid_postfix([T|Ts], Acc, Count) :-
    integer(T),
    Acc1 is Acc + 1,
    valid_postfix(Ts, Acc1, Count).

valid_postfix([T|Ts], Acc, Count) :-
    is_operator(T),
    Acc >= 2,
    Acc1 is Acc - 1,
    valid_postfix(Ts, Acc1, Count).