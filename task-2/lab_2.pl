% Владыченко Дарья Николаевна
% Задача: № 2 (Подсчитать количество листьев бинарного дерева)
% Условие: Бинарное дерево задается термами nil или node(Value, Left, Right).
% Требуется подсчитать количество листьев (узлов, у которых оба потомка равны nil).
% Пример: node(1,node(2,nil,nil),node(3,nil,nil)). Результат: 2.

% count_leaves(Tree, Count)
% Базовый случай 1: пустое дерево (nil) содержит 0 листьев
count_leaves(nil, 0).

% Базовый случай 2: узел, у которого оба потомка равны nil, является листом
count_leaves(node(_, nil, nil), 1) :- !.

% Рекурсивный случай: сумма листьев в левом и правом поддеревьях
count_leaves(node(_, Left, Right), Count) :-
count_leaves(Left, LCount),
count_leaves(Right, RCount),
Count is LCount + RCount.

% Примеры запросов
% ?- count_leaves(nil, Result). пустое дерево
% ?- count_leaves(node(10, nil, nil), Result). один лист-корень
