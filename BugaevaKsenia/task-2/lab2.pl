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
/*начальный путь одна вершина*/
simple_path(A, B, K, Edges, FinalPath) :-
    simple_path(A, B, K, Edges, [A], FinalPath).

simple_path(B, B, 0, _, Path, Path). /*k=0 => мы в точке B*/
/* Рекурсивный шаг*/
simple_path(A, B, K, Edges, Path, FinalPath) :-
    K > 0,
    neighbor(A, Next, Edges),
     \+ member(Next, Path ), 
    K1 is K - 1,
    simple_path(Next, B, K1, Edges, [Next|Path], FinalPath).

has_simple_path(_Vertices, Edges, A, B, K) :-
    simple_path(A, B, K, Edges, _).

/*
Тестовые примеры:

1. Есть путь
has_simple_path([a,b,c,d], [(a,b),(b,d),(a,c),(c,d)], a, d, 2).

2. Нет пути
has_simple_path([a,b,c,d], [(a,b),(b,c)], a, d, 2).

3.  Нет пути из-за отсутствия ребер (должно быть false)

has_simple_path([a,b,c,d], [(a,b),(b,c)], a, d, 2).

4. Слишком короткий путь (нужно 3 ребра, а между a и d можно дойти только за 2)
has_simple_path([a,b,c,d], [(a,b),(b,d)], a, d, 3).

5. K = 0

has_simple_path([a,b,c,d], [(a,b),(b,d)], a, d, 3).

6.Путь существует, но он не единственный (должно быть true)
has_simple_path([a,b,c,d], [(a,b),(b,c),(c,d),(a,d)], a, d, 3).

7. Путь с повторами в графе с циклом (должно быть false)

has_simple_path([a,b,c], [(a,b),(b,c),(c,a)], a, a, 3).

*/