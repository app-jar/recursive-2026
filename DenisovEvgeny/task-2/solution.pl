% ФИО: Денисов Евгений
% Лабораторная работа: 2
% Условие задачи (Номер 6): Найти минимальное значение среди всех узлов непустого бинарного дерева.
% Пример: node(5,node(2,nil,nil),node(8,nil,nil)) -> Результат: 2.

% Вспомогательный предикат для поиска меньшего из двух чисел
min_val(A, B, A) :- A =< B, !.
min_val(_, B, B).

% Главный предикат: min_node(+Tree, -Min)
% Базовый случай: узел без детей (листок), у которого левое и правое поддерево — это nil
min_node(node(Val, nil, nil), Val) :- !.

% Случай 1: есть только левое поддерево (правое — nil)
min_node(node(Val, Left, nil), Min) :-
    min_node(Left, LeftMin),
    min_val(Val, LeftMin, Min), !.

% Случай 2: есть только правое поддерево (левое — nil)
min_node(node(Val, nil, Right), Min) :-
    min_node(Right, RightMin),
    min_val(Val, RightMin, Min), !.

% Случай 3: есть оба поддерева (и левое, и правое не nil)
min_node(node(Val, Left, Right), Min) :-
    min_node(Left, LeftMin),
    min_node(Right, RightMin),
    min_val(Val, LeftMin, TempMin),
    min_val(TempMin, RightMin, Min).