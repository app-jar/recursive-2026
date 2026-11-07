/*
Гурьева Полина 9 группа
Лабораторная № 2 задача 11

Условие: Транспонировать прямоугольную матрицу.
Вход: Матрица в виде списка строк одинаковой длины.

Примеры тестов для запуска вручную:
transpose([[1,2,3],[4,5,6]], X).
transpose([], X).
transpose([[],[]], X).
*/

% Базовые случаи (включая пустые строки)
transpose([], []).
transpose([[]|_], []).

% Основная логика
transpose(Matrix, [Head_Col | Tail_Col]) :-
    extract_first_elements(Matrix, Head_Col, Tails),
    transpose(Tails, Tail_Col).

extract_first_elements([], [], []).
extract_first_elements([[H|T]|Rows], [H|Heads], [T|Tails]) :-
    extract_first_elements(Rows, Heads, Tails).
