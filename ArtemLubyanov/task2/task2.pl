%Лубянов Артем Андреевич, 20 номер
%Вычислить произведение двух матриц. Если размеры не позволяют
%выполнить умножение, сообщить о невозможности операции.
%Вход: Две матрицы A и B в виде списков строк.
%Пример: A = [[1,2],[3,4]], B = [[5,6],[7,8]].
%Результат: [[19,22],[43,50]].

% Вспомогательный предикат для проверки длины списка
list_length([], 0).
list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.

% Вспомогательный предикат для получения первой строки матрицы
first_row([H|_], H).

% Транспонирование матрицы (чтобы удобно брать столбцы B)
transpose([], []).
transpose([[]|_], []).
transpose(Matrix, [Col|Cols]) :-
    extract_first_column(Matrix, Col, Rest),
    transpose(Rest, Cols).

extract_first_column([], [], []).
extract_first_column([[H|T]|Rows], [H|Col], [T|Rest]) :-
    extract_first_column(Rows, Col, Rest).

% Скалярное произведение двух векторов (строки A и столбца B)
dot_product([], [], 0).
dot_product([H1|T1], [H2|T2], Sum) :-
    dot_product(T1, T2, RestSum),
    Sum is H1 * H2 + RestSum.

% Умножение одной строки A на всю матрицу B
multiply_row_by_matrix(_, [], []).
multiply_row_by_matrix(RowA, [RowB|RestB], [Sum|RestSums]) :-
    dot_product(RowA, RowB, Sum),
    multiply_row_by_matrix(RowA, RestB, RestSums).

% Умножение всех строк матрицы A на матрицу B
multiply_rows([], _, []).
multiply_rows([RowA|RestA], B, [ResultRow|RestResult]) :-
    multiply_row_by_matrix(RowA, B, ResultRow),
    multiply_rows(RestA, B, RestResult).

% Проверка возможности умножения: столбцы A == строки B
can_multiply(A, B) :-
    first_row(A, FirstRowA),
    list_length(FirstRowA, ColsA),
    list_length(B, RowsB),
    ColsA =:= RowsB.

mult_matrix(A, B, Result) :-
    (   can_multiply(A, B) ->
        transpose(B, B_T),
        multiply_rows(A, B_T, Result)
    ;   write('Невозможно выполнить умножение: несовместимые размеры матриц.'), nl,
        fail
    ).

