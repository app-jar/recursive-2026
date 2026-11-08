% Маслов Максим Сергеевич
% Задание 1
% Вариант 26
% Найти длину самого длинного строго возрастающего фрагмента списка.
% Фрагмент должен состоять из последовательных элементов.


% Основной предикат
max_increasing(List, Max) :-
    max_increasing(List, 0, 0, Max).

% Пустой список
max_increasing([], Current, Max, Result) :-
    Result is max(Current, Max).

% Первый элемент списка
max_increasing([_], Current, Max, Result) :-
    Result is max(Current + 1, Max).

% Если следующий элемент больше предыдущего
max_increasing([X, Y | T], Current, Max, Result) :-
    Y > X,
    NewCurrent is Current + 1,
    max_increasing([Y | T], NewCurrent, Max, Result).

% Если следующий элемент меньше или равен предыдущему
max_increasing([X, Y | T], Current, Max, Result) :-
    Y =< X,
    NewMax is max(Max, Current + 1),
    max_increasing([Y | T], 0, NewMax, Result).


% Тесты

% ?- max_increasing([1, 2, 5, 3, 4, 7, 8], X).
% X = 4.

% ?- max_increasing([1, 2, 3, 4, 5], X).
% X = 5.

% ?- max_increasing([5, 4, 3, 2, 1], X).
% X = 1.

% ?- max_increasing([1, 1, 1, 1], X).
% X = 1.

% ?- max_increasing([1, 3, 2, 4, 6, 8], X).
% X = 4.

% ?- max_increasing([7], X).
% X = 1.

% ?- max_increasing([], X).
% X = 0.