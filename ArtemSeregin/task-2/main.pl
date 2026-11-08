% ФИО: Серегин Артём Валерьевич.
% Лабораторная работа № 2. Вариант 14.
% Условие: получить список элементов главной диагонали квадратной матрицы.
% Вход: квадратная матрица, представленная списком строк.
% Пример: [[1, 2, 3], [4, 5, 6], [7, 8, 9]].
% Результат: [1, 5, 9].

% main_diagonal(+Matrix, -Diagonal). Входная матрица должна быть квадратной.
main_diagonal(Matrix, Diagonal) :-
    diagonal_rows(Matrix, 1, Diagonal).

diagonal_rows([], _, []).
diagonal_rows([Row | Rows], Index, [Element | Rest]) :-
    % В строке с номером Index выбираем элемент с тем же номером.
    element_at(Row, Index, Element),
    NextIndex is Index + 1,
    diagonal_rows(Rows, NextIndex, Rest).

element_at([Head | Tail], Index, Element) :-
    ( Index =:= 1 ->
        Element = Head
    ;
        Index > 1,
        PreviousIndex is Index - 1,
        element_at(Tail, PreviousIndex, Element)
    ).
