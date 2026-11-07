/*
Денисов Николай 9 группа
Лабораторная № 2 задача 21

Условие:
Подсчитать количество рёбер неориентированного графа.
На вход подаются список вершин и список рёбер графа.

Пример:
Вершины: [a, b, c]
Рёбра: [(a,b), (a,c)].
Результат: 2.

Примеры тестов для запуска вручную:

edge_count([a,b,c], [(a,b),(a,c)], N).
N = 2.

edge_count([a,b,c,d], [], N).
N = 0.

edge_count([a,b,c], [(a,b),(b,c),(c,a)], N).
N = 3.

Можешь скопировать их и вставить, когда будешь проверять работоспособность.
Заранее спасибо за review!
*/

% edge_count(+Vertices, +Edges, -Count)
% Count - количество рёбер неориентированного графа.
edge_count(_, Edges, Count) :-
    count_elements(Edges, 0, Count).

% count_elements(+List, +Acc, -Count)
% Рекурсия с накопителем (хвостовая): считает элементы списка.
count_elements([], Acc, Acc).
count_elements([_|Tail], Acc, Count) :-
    Acc1 is Acc + 1,
    count_elements(Tail, Acc1, Count).

