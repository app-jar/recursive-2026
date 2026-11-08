% ФИО: Новохатский Станислав
% Задача №17
% Условие: Вычислить сумму элементов каждого столбца матрицы.

% Входной предикат:
% column_sums(+Matrix, -Result)

column_sums([], []).
column_sums([[]|_], []) :- !.
column_sums(Matrix, [Sum|Rest]) :-
    sum_heads(Matrix, Sum, Tails),
    column_sums(Tails, Rest).

% Суммирование первых элементов каждой строки
% и получение оставшихся частей строк.
sum_heads([], 0, []).
sum_heads([[H|T]|Rows], Sum, [T|Tails]) :-
    sum_heads(Rows, Sum1, Tails),
    Sum is H + Sum1.

% Точка входа
:- initialization(main).

main :-
    column_sums([[1,2], [3,4]], Result),
    write('Column sums: '),
    write(Result),
    nl.
