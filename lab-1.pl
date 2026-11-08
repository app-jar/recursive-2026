all_distinct([]).
all_distinct([_]).

all_distinct([H|T]) :-
    \+ member(H, T),
    all_distinct(T).

member(X, [X|_]).
member(X, [_|T]) :- member(X, T).