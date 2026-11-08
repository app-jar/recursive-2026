% Маслов Максим Сергеевич
% Задание 2
% Вариант 13
% Проверить, является ли квадратная матрица единичной.

identity_matrix(Matrix) :-
    length(Matrix, N),
    check_rows(Matrix, 1, N).

% Проверка всех строк матрицы
check_rows([], _, _).

check_rows([Row | T], I, N) :-
    length(Row, N),
    check_row(Row, I, 1),
    NextI is I + 1,
    check_rows(T, NextI, N).

% Проверка элементов строки
check_row([], _, _).

check_row([X | T], I, J) :-
    ( I =:= J ->
        X =:= 1
    ;
        X =:= 0
    ),
    NextJ is J + 1,
    check_row(T, I, NextJ).



% Тесты

% ?- identity_matrix([[1,0,0],[0,1,0],[0,0,1]]).
% true.

% ?- identity_matrix([[1,0],[0,1]]).
% true.

% ?- identity_matrix([[1,0],[1,1]]).
% false.

% ?- identity_matrix([[1,2],[0,1]]).
% false.

% ?- identity_matrix([[1,0,0],[0,1,0]]).
% false.

% ?- identity_matrix([[1]]).
% true.

% ?- identity_matrix([]).
% true.