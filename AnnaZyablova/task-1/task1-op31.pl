% Задача 31.
% Получить список элементов первого списка, которых нет во втором.

member_elem(X, [X|_]).
member_elem(X, [_|T]) :-
    member_elem(X, T).

not_member_elem(_, []).
not_member_elem(X, [H|T]) :-
    X \= H,
    not_member_elem(X, T).

op31([], _, []).

op31([H|T], L2, [H|R]) :-
    not_member_elem(H, L2),
    op31(T, L2, R).

op31([H|T], L2, R) :-
    member_elem(H, L2),
    op31(T, L2, R).