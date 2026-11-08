% ФИО: Серегин Артём Валерьевич.
% Лабораторная работа № 1. Вариант 27.
% Условие: вставить заданное число после каждого вхождения указанного элемента.
% Вход: список, искомый элемент и вставляемое число.
% Пример: [1, 2, 3, 2, 4], элемент 2, число 0.
% Результат: [1, 2, 0, 3, 2, 0, 4].

% insert_after(+List, +Target, +Number, -Result).
% List и Target заданы без свободных переменных, Number — число.
insert_after([], _, _, []).
insert_after([Head | Tail], Target, Number, Result) :-
    ( Head == Target ->
        Result = [Head, Number | Rest]
    ;
        Result = [Head | Rest]
    ),
    % Продолжаем обход исходного хвоста: вставленное число не обрабатываем.
    insert_after(Tail, Target, Number, Rest).
