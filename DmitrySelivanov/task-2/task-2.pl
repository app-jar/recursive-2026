% Селивано Д.А. 9 группа
% Задача 7
% Условие: Найти максимальное значение среди всех узлов непустого бинарного дерева.
% Вход: Непустое бинарное дерево с числовыми значениями в узлах.
% Пример: node(5,node(2,nil,nil),node(8,nil,nil)). 
% Результат: 8.

% Основной предикат
tree_max(nil, nil).

% Находим максимумы в ветках и сравниваем их со значением текущего узла
tree_max(node(Value, Left, Right), Max) :-
    tree_max(Left, MaxL),
    tree_max(Right, MaxR),
    max_of_three(Value, MaxL, MaxR, Max).

% Вспомогательный предикат
% Обе ветки пустые
max_of_three(Value, nil, nil, Value).

% Левая ветка пустая
max_of_three(Value, nil, MaxR, Max) :-
    Max is max(Value, MaxR).

% Правая ветка пустая
max_of_three(Value, MaxL, nil, Max) :-
    Max is max(Value, MaxL).

% Обе ветки непустые
max_of_three(Value, MaxL, MaxR, Max) :-
    Temp is max(Value, MaxL),
    Max is max(Temp, MaxR).