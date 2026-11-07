% ФИО: Пальчикова Ирина
% Лабораторная работа 2
% Вариант 26
% Условие: Проверить, является ли граф полным.

complete([], _).

complete([V | T], Edges) :-
    check_edges(V, T, Edges),
    complete(T, Edges).

check_edges(_, [], _).

check_edges(V, [H | T], Edges) :-
    (member([V, H], Edges) ; member([H, V], Edges)),
    check_edges(V, T, Edges).

is_complete(Vertices, Edges) :- complete(Vertices, Edges).

% Пример: is_complete([a,b,c], [[a,b],[a,c],[b,c]]).
