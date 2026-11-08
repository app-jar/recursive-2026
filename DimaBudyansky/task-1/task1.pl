arith_prog_sums(A, D, N, Result) :-
    N >= 0,
    arith_prog_sums_(1, A, D, N, 0, [], Result).

arith_prog_sums_(I, _, _, N, _, Acc, Result) :-
    I > N, !,
    reverse(Acc, Result).
arith_prog_sums_(I, A, D, N, PrevSum, Acc, Result) :-
    Term is A + (I-1)*D,
    Sum is PrevSum + Term,
    arith_prog_sums_(I+1, A, D, N, Sum, [Sum|Acc], Result).