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

% Тесты:
% is_complete([a,b,c], [[a,b],[a,c],[b,c]]).
%      ответ: true (полный граф)
% is_complete([a,b,c], [[a,b],[a,c]]).
%      ответ: false (не хватает ребра b-c)
% is_complete([a,b], [[a,b]]).
%      ответ: true (полный граф из 2 вершин)
% is_complete([a,b], []).
%      ответ: false (нет ребер)
% is_complete([1,2,3,4], [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]).
%      ответ: true (полный граф из 4 вершин)
% is_complete([1,2,3,4], [[1,2],[2,3],[3,4],[4,1],[1,3]]).
%      ответ: false (не хватает ребра 2-4)
% is_complete([a], []).
%      ответ: true (граф из одной вершины)
% is_complete([], []).
%      ответ: true (пустой граф)
% is_complete([a,b,c], [[b,a],[c,a],[c,b]]).
%      ответ: true (ребра записаны в обратном порядке)
