/*
Гурьева Полина 9 группа
Лабораторная № 2 задача 11

Условие: Транспонировать матрицу.
Вход: Матрица в виде списка строк.
*/


% Основная логика
transpose(Matrix, [Head_Col | Tail_Col]) :-
    extract_first_elements(Matrix, Head_Col, Tails),
    transpose(Tails, Tail_Col).

extract_first_elements([], [], []).
extract_first_elements([[H|T]|Rows], [H|Heads], [T|Tails]) :-
    extract_first_elements(Rows, Heads, Tails).
