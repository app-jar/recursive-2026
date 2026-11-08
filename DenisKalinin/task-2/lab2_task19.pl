% Калинин Денис Александрович
% Лаба 2 вариант 19

% Условие: Проверить, является ли матрица разреженной: 
% нулевых элементов должно быть строго больше, чем ненулевых.

% Вход: Матрица в виде списка строк одинаковой длины.

% Проверка разреженности матрицы.
% Матрица задана списком строк (списков чисел).
% Результат: yes(Zeros, NonZeros) — если нулей строго больше,
%           no(Zeros, NonZeros)  — иначе.

sparse_matrix(Matrix, Result) :-
    flatten(Matrix, Flat),          % превращаем матрицу в плоский список
    count_zeros(Flat, Zeros),       % считаем нули
    length(Flat, Total),            % общее количество элементов
    NonZeros is Total - Zeros,      % количество ненулевых
    (   Zeros > NonZeros
    ->  Result = yes(Zeros, NonZeros)
    ;   Result = no(Zeros, NonZeros)
    ).

% Подсчёт нулей в плоском списке
count_zeros([], 0).
count_zeros([0|T], N) :-
    count_zeros(T, N1),
    N is N1 + 1.
count_zeros([H|T], N) :-
    H =\= 0,
    count_zeros(T, N).