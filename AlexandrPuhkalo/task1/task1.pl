/*
Пухкало Александр, 9 группа
Лабораторная № 1 задача 25

Условие:
Найти длину самого длинного фрагмента списка, состоящего из одинаковых элементов.
Фрагмент должен состоять из последовательных элементов.

Примеры тестов для запуска вручную:
max_len([1, 2, 2, 2, 3, 3, 4], Result).  % Result = 3
max_len([1, 1, 1, 1], Result).           % Result = 4
max_len([1, 2, 3, 4], Result).           % Result = 1
max_len([], Result).                     % Result = 0
max_len([5], Result).                    % Result = 1
*/

% Базовый случай: пустой список
max_len([], 0).

% Основной предикат: запускаем процесс подсчета
max_len(List, MaxLen) :-
    List = [H|T],
    count_max(List, H, 1, MaxLen),
    !.

% Базовый случай: список закончился, возвращаем накопленный максимум
count_max([], _, CurrentMax, CurrentMax) :- !.

% Случай 1: следующий элемент равен текущему (серия продолжается)
count_max([H|T], CurrentElem, CurrentLen, MaxLen) :-
    H == CurrentElem, !, 
    NewLen is CurrentLen + 1,
    count_max(T, CurrentElem, NewLen, MaxLen).

% Случай 2: следующий элемент отличается (серия прервалась)
count_max([H|T], CurrentElem, CurrentLen, MaxLen) :-
    H \== CurrentElem,
    (   CurrentLen > MaxLen -> NewMax is CurrentLen 
    ;   NewMax = MaxLen
    ),
    count_max(T, H, 1, NewMax).
