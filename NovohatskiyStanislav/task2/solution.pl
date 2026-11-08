% ФИО: Новохатский Станислав
% Задача №17
% Условие: Вычислить сумму элементов каждого столбца матрицы.

% Проверка одинаковой длины строк матрицы
valid_matrix([]).
valid_matrix([Row|Rows]) :-
    maplist(same_length(Row), Rows).

% Входной предикат
column_sums(Matrix, Result) :-
    valid_matrix(Matrix),
    column_sums_valid(Matrix, Result).

% Вычисление сумм столбцов
column_sums_valid([], []).
column_sums_valid([[]|_], []) :- !.
column_sums_valid(Matrix, [Sum|Rest]) :-
    sum_heads(Matrix, Sum, Tails),
    column_sums_valid(Tails, Rest).

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
    nl,

    column_sums([[2, 4, 6]], OneRow),
    write('Single row: '),
    write(OneRow),
    nl,

    column_sums([[5], [10], [15]], OneColumn),
    write('Single column: '),
    write(OneColumn),
    nl,

    column_sums([], Empty),
    write('Empty matrix: '),
    write(Empty),
    nl,

    (column_sums([[1, 2], [3]], _)
    -> write('Invalid matrix accepted')
    ;  write('Invalid matrix rejected')),
    nl.