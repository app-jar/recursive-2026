%Крылова Татьяна Владимировна, 16 номер
%Вычислить сумму элементов каждой строки матрицы.
%Вход: Матрица в виде списка строк одинаковой длины.
%Пример: [[1,2],[3,4]].
%Результат: [3, 7].

to_number(X, N) :- number(X), !, N = X.
to_number(-X, N) :- !, to_number(X, N1), N is -N1.
to_number(X, N) :- N is X.

sum_list([], 0).
sum_list([H|T], Sum) :- 
    to_number(H, Num), 
    sum_list(T, TailSum), 
    Sum is Num + TailSum.

matrix_row_sums([], []).
matrix_row_sums([Row|RestRows], [RowSum|RestSums]) :-
    sum_list(Row, RowSum),
    matrix_row_sums(RestRows, RestSums).
