/*
Пухкало Александр, 9 группа
Лабораторная № 2 задача 12

Условие:
Проверить, является ли квадратная матрица симметричной относительно главной диагонали.
Вход: Квадратная матрица (список строк).
Пример: [[1,2,3],[2,4,5],[3,5,6]].
Результат: Да (true).

Примеры тестов для запуска вручную:
is_symmetric([[1,2,3],[2,4,5],[3,5,6]]).      % true (симметричная из условия)
is_symmetric([[1,2],[2,1]]).                  % true (симметричная 2х2)
is_symmetric([[1,2,3],[4,5,6],[7,8,9]]).      % false (не симметричная)
is_symmetric([[5]]).                          % true (матрица 1х1 всегда симметрична)
is_symmetric([]).                             % true (пустая матрица)
*/

% Основной предикат: матрица симметрична, если она равна своей транспонированной версии
is_symmetric(Matrix) :-
    transpose_matrix(Matrix, Transposed),
    Matrix == Transposed.

% Базовый случай: пустая матрица транспонируется в пустую
transpose_matrix([], []).

% Если в матрице есть хотя бы одна строка
transpose_matrix([FirstRow|RestRows], Transposed) :-
    FirstRow = [FirstElem|RestElems],
    get_column_heads([FirstRow|RestRows], Heads),
    get_column_tails([FirstRow|RestRows], Tails),
    Transposed = [Heads|TransposedRest],
    transpose_matrix(Tails, TransposedRest).

get_column_heads([], []).
get_column_heads([[H|_]|T], [H|Heads]) :-
    get_column_heads(T, Heads).

get_column_tails([], []).
get_column_tails([[_|T]|Rows], [T|Tails]) :-
    get_column_tails(Rows, Tails).
