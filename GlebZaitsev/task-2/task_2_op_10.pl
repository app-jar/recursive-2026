% ФИО: Зайцев Глеб Андреевич
% Лабораторная работа №2
% Вариант 10
% Условие: найти уровень узла с заданным
% значением в бинарном дереве.
% Корневой узел находится на уровне 0.
% Дерево представлено как node(Value, Left, Right).
% Пустое дерево обозначается nil.
%
% Пример:
% node(1, node(2, nil, nil), node(3, nil, nil))
% Уровень узла 3: 1.

% Базовый случай: искомое значение находится в корне дерева.
node_level(node(Value, _, _), Value, 0).

% Поиск узла в левом поддереве
node_level(node(_, Left, _), Value, Level) :-
    node_level(Left, Value, PreviousLevel),
    Level is PreviousLevel + 1.

% Поиск узла в правом поддереве
node_level(node(_, _, Right), Value, Level) :-
    node_level(Right, Value, PreviousLevel),
    Level is PreviousLevel + 1.

% Тестовые случаи

test_root :-
    node_level(node(1, nil, nil), 1, 0).

test_left :-
    node_level(
        node(1, node(2, nil, nil), nil),
        2, 1
    ).

test_right :-
    node_level(
        node(1, nil, node(3, nil, nil)),
        3, 1
).

test_tree :-
    node_level(
        node(1, node(2, nil, nil), node(3, nil, nil)),
        3, 1
).


% Проверка одинаковых значений на разных уровнях
test_duplicates :-
    Tree = node(1,
                node(2, nil, nil),
                node(3, node(2, nil, nil), nil)),
    findall(Level, node_level(Tree, 2, Level), Levels),
    Levels = [1, 2].

% Проверка отсутствующего узла
test_not_found :-
    Tree = node(1,
                node(2, nil, nil),
                node(3, nil, nil)),
    \+ node_level(Tree, 5, _).

% Проверка поиска узла на четвертом уровне
test_deep_tree :-
    Tree = node(1,
                node(2,
                     node(4,
                          node(6,
                               node(8, nil, nil),
                               nil),
                          nil),
                     nil),
                node(3, nil, nil)),
    node_level(Tree, 8, 4).