/*
Колесникова Алёна Николаевна, Лабораторная работа № 2, вариант 4
Выполнить обратный обход бинарного дерева: левое поддерево, правое поддерево, корень.
Вход: Бинарное дерево, заданное термами nil или node(Value, Left, Right).
Пример: node(1,node(2,nil,nil),node(3,nil,nil)).
Результат: [2, 3, 1].
*/

% Базовый случай: пустое дерево 
postorder(nil, []).

% Рекурсивный случай: обрабатываем узел node(Value, Left, Right).
postorder(node(Value, Left, Right), Result) :-
    % Сначала получаем обход левого поддерева
    postorder(Left, LeftResult),
    % Затем получаем обход правого поддерева
    postorder(Right, RightResult),
    % Соединяем левый обход, правый обход и добавляем в конец значение корня
    append(LeftResult, RightResult, TempResult),
    append(TempResult, [Value], Result).
