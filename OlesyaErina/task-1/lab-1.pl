% Ерина О.С 9 группа
% задача 12
% Проверить, является ли список повторением одного и того же списка N раз.


% Вспомогательный предикат для повторения списка N раз
repeat_list(_, 0, []) :- !.
repeat_list(List, N, Result) :-
    N > 0,
    N1 is N - 1,
    repeat_list(List, N1, Tail),
    append(List, Tail, Result).

% Основной предикат проверки
is_repeated_n_times(List, N) :-
    N > 0,                      % N должно быть положительным
    length(List, Len),         
    Len > 0,                    % Список не должен быть пустым
    Len mod N =:= 0,            % Длина должна делиться на N без остатка
    BaseLen is Len // N,        % Вычисляем длину повторяющегося кусочка
    length(Base, BaseLen),      % Создаем список Base нужной длины
    append(Base, _, List),
    repeat_list(Base, N, List). % Проверяем, что повторение Base N раз дает исходный List

    /*тестовые примеры:
     is_repeated_n_times([1, 2, 3, 1, 2, 3, 1, 2, 3], 3).
     ответ: true
     is_repeated_n_times([1],1).
     ответ: true
     is_repeated_n_times([1, 2, 3, 1, 2, 3, 1, 2, 4], 3).
     ответ: false
     is_repeated_n_times([apple, orange, banana], 1).
     ответ: true.
     is_repeated_n_times([a, b, c, d], 4).
     ответ: false. 
     is_repeated_n_times([1,1,1,1], 2)
    ответ: true.
    is_repeated_n_times([], 3)
    ответ: false. 
    is_repeated_n_times([1,2], 3)
    ответ: false. 
    is_repeated_n_times([a, b, a, b], 2). - true.
    is_repeated_n_times([a, a, a], 3) - true.
*/