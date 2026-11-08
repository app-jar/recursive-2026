% ФИО: Буряк Григорий
% Лабораторная работа 2
% Вариант 28
% Условие: Проверить, является ли граф двудольным: вершины можно разделить
% на две группы так, чтобы каждое ребро соединяло вершины из разных групп.

is_bipartite(Vertices, Edges) :-
    color_all(Vertices, Edges, []).

% Раскрашиваем вершины по очереди, обходя компоненты связности
color_all([], _, _).
color_all([V | T], Edges, Colors) :-
    (   memberchk(V-_, Colors)
    ->  color_all(T, Edges, Colors)
    ;   color_vertex(V, 0, Edges, Colors, NewColors),
        color_all(T, Edges, NewColors)
    ).

% Красим вершину V в цвет C и рекурсивно красим соседей в противоположный цвет
color_vertex(V, C, Edges, Colors, Colors) :-
    memberchk(V-C0, Colors), !,
    C0 =:= C.
color_vertex(V, C, Edges, Colors, NewColors) :-
    neighbors(V, Edges, Ns),
    C1 is 1 - C,
    color_list(Ns, C1, Edges, [V-C | Colors], NewColors).

color_list([], _, _, Colors, Colors).
color_list([N | T], C, Edges, Colors, NewColors) :-
    color_vertex(N, C, Edges, Colors, Colors1),
    color_list(T, C, Edges, Colors1, NewColors).

% Список соседей вершины V
neighbors(_, [], []).
neighbors(V, [(V, B) | T], [B | R]) :- !,
    neighbors(V, T, R).
neighbors(V, [(A, V) | T], [A | R]) :- !,
    neighbors(V, T, R).
neighbors(V, [_ | T], R) :-
    neighbors(V, T, R).

% Тесты:
% is_bipartite([a,b,c,d], [(a,b),(b,c),(c,d)]).
%     ответ: true
% is_bipartite([a,b,c], [(a,b),(b,c),(c,a)]).
%     ответ: false (цикл нечётной длины)
% is_bipartite([a,b,c,d], [(a,b),(b,c),(c,d),(d,a)]).
%     ответ: true (цикл чётной длины)
% is_bipartite([a,b,c,d], [(a,b),(c,d)]).
%     ответ: true (несвязный граф)
% is_bipartite([a], []).
%     ответ: true
% is_bipartite([], []).
%     ответ: true
