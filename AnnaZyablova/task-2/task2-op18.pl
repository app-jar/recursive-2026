% Зяблова Анна 9 группа
% Задача 2,
% Вариант 18.
% Повернуть квадратную матрицу на 90 градусов по часовой стрелке.

% Перевернуть список
reverse_list([], []).
reverse_list([H|T], R) :-
    reverse_list(T, RT),
    append(RT, [H], R).

% Транспонировать матрицу
transpose([], []).
transpose([[]|_], []).
transpose(Matrix, [Col|Cols]) :-
    get_first_column(Matrix, Col, Rest),
    transpose(Rest, Cols).

get_first_column([], [], []).
get_first_column([[H|T]|Rows], [H|Col], [T|Rest]) :-
    get_first_column(Rows, Col, Rest).

% Поворот матрицы на 90 градусов по часовой стрелке
op18(Matrix, Result) :-
    reverse_list(Matrix, Reversed),
    transpose(Reversed, Result).