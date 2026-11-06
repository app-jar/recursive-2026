/*
Бугаева Ксения
Лабораторная работа №2  Вариант 30

Условие:
Графы
Проверить, существует ли между двумя заданными вершинами простой путь ровно из K рёбер. В простом пути вершины не повторяются.
Вход: Список вершин, список рёбер, начальная вершина A, конечная вершина B и целое неотрицательное число K.
Пример: Вершины [a,b,c,d], рёбра [(a,b),(b,d),(a,c),(c,d)]; A = a, B = d, K = 2.
Результат: Да: существуют пути a-b-d и a-c-d.
*/

neighbor(V, N, Edges) :- member((V, N), Edges). /* Проверка прямого соседства*/
neighbor(V, N, Edges) :- member((N, V), Edges). /* Обратное соседство (неориентированный граф)*/

/*Поиск пути*/
simple_path(A, B, 0, _, [A]) :- A =:= B.
simple_path(A, B, K, Edges, [A|Path]) :-
    K > 0,
    neighbor(A, Next, Edges),
     \+ member(Next, ), /**/
    K1 is K - 1,
    simple_path(Next, B, K1, Edges, Path).

has_simple_path(_Vertices, Edges, A, B, K) :-
    simple_path(A, B, K, Edges, _).

/*
Тестовые примеры:

1. Есть путь
has_simple_path([a,b,c,d], [(a,b),(b,d),(a,c),(c,d)], a, d, 2).

2. Нет пути
has_simple_path([a,b,c,d], [(a,b),(b,c)], a, d, 2).
*/