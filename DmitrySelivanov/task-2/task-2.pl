% Селивано Д.А. 9 группа
% Задача 7
% Условие: Найти максимальное значение среди всех узлов непустого бинарного дерева.
% Вход: Непустое бинарное дерево с числовыми значениями в узлах.
% Пример: node(5,node(2,nil,nil),node(8,nil,nil)). 
% Результат: 8.

% Основной предикат
tree_max(node(Value, Left, Right), Max) :-
    max_in_branch(Left, MaxL),
    max_in_branch(Right, MaxR),
    max_list([Value, MaxL, MaxR], Max).

% Вспомогательный предикат для безопасного получения максимума из ветки
max_in_branch(nil, 0) :- !. 
max_in_branch(Node, Max) :-
    tree_max(Node, Max).

% Вспомогательный предикат для поиска максимума в списке
max_list([X], X) :- !.
max_list([H|T], Max) :-
    max_list(T, MaxTail),
    Max is max(H, MaxTail).