% Перминов Илья
% Задание 2, вариант 9
% Подсчитать количество узлов, имеющих ровно одного потомка.
% Вход: Бинарное дерево, заданное термами nil или node(Value, Left, Right).

% Базовый случай: пустое дерево
count_single_child(nil, 0) :- !.

% Базовый случай: узел является листом
count_single_child(node(_, nil, nil), 0) :- !.

% Узел имеет только левого потомка
count_single_child(node(_, Left, nil), Count) :- !, count_single_child(Left, C1), Count is C1 + 1.

% Узел имеет только правого потомка
count_single_child(node(_, nil, Right), Count) :- !, count_single_child(Right, C1), Count is C1 + 1.

% Узел имеет двух потомков
count_single_child(node(_, Left, Right), Count) :- !, count_single_child(Left, C1), count_single_child(Right, C2), Count is C1 + C2.

% Тесты:
% count_single_child(node(1, node(2, node(3, nil, nil), nil), nil), Res)
% 	Res = 2
% count_single_child(node(1, node(2, nil, nil), node(3, nil, nil)), Res)
% 	Res = 0
% count_single_child(node(1, node(2, node(4, nil, nil), nil), node(3, nil, node(5, node(6, nil, nil), nil))), Res)
% 	Res = 3
