/*
Акованцев Тимур
Лабораторная работа №2  Вариант 29

Проверить, является ли граф деревом: он должен быть связным и не содержать циклов.
Вход: Список вершин и список рёбер.
Пример: Вершины [a,b,c], рёбра [(a,b),(b,c)].
Результат: Да.
*/

/*Удаление одного ненаправленного ребра (U, V) из списка рёбер*/
remove_edge(U, V, [(U, V)|Rest], Rest).
remove_edge(U, V, [(V, U)|Rest], Rest) :-
    U \== V.
remove_edge(U, V, [E|Rest], [E|NewRest]) :-
    remove_edge(U, V, Rest, NewRest).

/*Проверка смежности двух вершин U и V по списку рёбер*/
adjacent(U, V, Edges) :-
    member((U, V), Edges).
adjacent(U, V, Edges) :-
    member((V, U), Edges).

/*Проверка, что все рёбра инцидентны вершинам из заданного множества Vertices*/
valid_edges([], _).
valid_edges([(U, V)|Rest], Vertices) :-
    member(U, Vertices),
    member(V, Vertices),
    valid_edges(Rest, Vertices).

/*Поиск всех вершин, достижимых из начальной с помощью обхода в глубину*/
dfs_reach([], Visited, _, Visited).
dfs_reach([Current|Rest], Visited, Edges, Result) :-
    member(Current, Visited), !,
    dfs_reach(Rest, Visited, Edges, Result).
dfs_reach([Current|Rest], Visited, Edges, Result) :-
    findall(Next, adjacent(Current, Next, Edges), Neighbors),
    append(Neighbors, Rest, NewQueue),
    dfs_reach(NewQueue, [Current|Visited], Edges, Result).

/*Проверка, что все элементы первого списка содержатся во втором*/
all_contained([], _).
all_contained([H|T], List) :-
    member(H, List),
    all_contained(T, List).

/*Граф связен, если из первой вершины достижимы все вершины множества Vertices*/
is_connected([], _) :- !, fail.
is_connected([Start|Rest], Edges) :-
    dfs_reach([Start], [], Edges, Reachable),
    all_contained([Start|Rest], Reachable).

/*Поиск цикла: если из Current по оставшимся рёбрам можно прийти в уже посещённую вершину*/
has_cycle_from(Current, Visited, Edges) :-
    remove_edge(Current, Next, Edges, _),
    member(Next, Visited), !.
has_cycle_from(Current, Visited, Edges) :-
    remove_edge(Current, Next, Edges, RemainingEdges),
    \+ member(Next, Visited),
    has_cycle_from(Next, [Next|Visited], RemainingEdges).

/*Проверка наличия цикла хотя бы в одной компоненте графа*/
has_cycle(Vertices, Edges) :-
    member(Start, Vertices),
    has_cycle_from(Start, [Start], Edges), !.

is_tree([], _) :- !, fail. /*Обработка пустого графа с отсечением*/

is_tree(Vertices, Edges) :- /*Граф является деревом, если он корректен, связен и не содержит циклов*/
    valid_edges(Edges, Vertices),
    is_connected(Vertices, Edges),
    \+ has_cycle(Vertices, Edges).
/*
Vertices - список вершин графа
Edges - список ненаправленных рёбер графа вида (U, V)
*/

/*
Пример для тестирования задачи:
is_tree([a, b, c], [(a, b), (b, c)]).

Ответ: true


Дополнительные примеры для тестирования:
1. Граф содержит простой цикл (треугольник) — не дерево
is_tree([a, b, c], [(a, b), (b, c), (c, a)]).

2. Несвязный граф из двух независимых компонент — не дерево
is_tree([a, b, c, d], [(a, b), (c, d)]).

3. Граф с изолированной вершиной — не дерево
is_tree([a, b, c], [(a, b)]).

4. Граф из одной изолированной вершины (тривиальное дерево)
is_tree([a], []).

5. Дерево в виде звезды
is_tree([a, b, c, d], [(a, b), (a, c), (a, d)]).

6. Граф с петлей (self-loop) — содержит цикл
is_tree([a], [(a, a)]).

7. Граф с кратными рёбрами — содержит цикл длины 2
is_tree([a, b], [(a, b), (b, a)]).

8. Некорректные данные (пустой список вершин)
is_tree([], []).
*/