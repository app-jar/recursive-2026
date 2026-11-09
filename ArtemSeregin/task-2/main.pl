% ФИО: Серегин Артём Валерьевич.
% Лабораторная работа № 2. Вариант 14.
% Условие: получить список элементов главной диагонали квадратной матрицы.
% Вход: квадратная матрица, представленная списком строк.
% Пример: [[1, 2, 3], [4, 5, 6], [7, 8, 9]].
% Результат: [1, 5, 9].

% main_diagonal(+Matrix, -Diagonal).
% Неквадратная матрица отклоняется: результат вызова — false.
main_diagonal(Matrix, Diagonal) :-
    is_list(Matrix),
    length(Matrix, Size),
    square_rows(Matrix, Size),
    diagonal_rows(Matrix, 1, Diagonal).

square_rows([], _).
square_rows([Row | Rows], Size) :-
    is_list(Row),
    length(Row, Size),
    square_rows(Rows, Size).

diagonal_rows([], _, []).
diagonal_rows([Row | Rows], Index, [Element | Rest]) :-
    % В строке с номером Index выбираем элемент с тем же номером.
    element_at(Row, Index, Element),
    NextIndex is Index + 1,
    diagonal_rows(Rows, NextIndex, Rest).

% element_at(+List, +Index, -Element).
% Index — положительный целый номер позиции, начиная с 1.
% При выходе за границы списка предикат завершается с false.
element_at([Head | Tail], Index, Element) :-
    ( Index =:= 1 ->
        Element = Head
    ;
        Index > 1,
        PreviousIndex is Index - 1,
        element_at(Tail, PreviousIndex, Element)
    ).
