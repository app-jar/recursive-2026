% Зяблова Анна 9 группа
% Лабораторная 1,
% Задача 31.
% Получить список элементов первого списка, которых нет во втором.

member_elem(X, [X|_]).
member_elem(X, [_|T]) :-
    member_elem(X, T).

op31([], _, []).

op31([H|T], L2, [H|R]) :-
    \+ member_elem(H, L2), 
    op31(T, L2, R).

op31([H|T], L2, R) :-
    member_elem(H, L2),
    op31(T, L2, R).
