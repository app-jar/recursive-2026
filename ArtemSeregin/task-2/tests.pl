% ФИО: Серегин Артём Валерьевич.
% Лабораторная работа № 2. Вариант 14.
% Условие: получить элементы главной диагонали квадратной матрицы.
% Проверка примера из задания и граничных случаев.

:- ensure_loaded('main.pl').
:- begin_tests(main_diagonal).

test(assignment_example, true(Result == [1, 5, 9])) :-
    main_diagonal([[1, 2, 3], [4, 5, 6], [7, 8, 9]], Result).

test(empty_matrix, true(Result == [])) :-
    main_diagonal([], Result).

test(one_element, true(Result == [7])) :-
    main_diagonal([[7]], Result).

test(two_by_two, true(Result == [1, 4])) :-
    main_diagonal([[1, 2], [3, 4]], Result).

test(four_by_four, true(Result == [1, 6, 11, 16])) :-
    main_diagonal([[1, 2, 3, 4], [5, 6, 7, 8],
                   [9, 10, 11, 12], [13, 14, 15, 16]], Result).

test(negative_and_fractional, true(Result == [-2, 0.5])) :-
    main_diagonal([[-2, 10], [20, 0.5]], Result).

test(atom_elements, true(Result == [a, d])) :-
    main_diagonal([[a, b], [c, d]], Result).

test(repeated_values, true(Result == [0, 0])) :-
    main_diagonal([[0, 0], [0, 0]], Result).

test(wrong_result, [fail]) :-
    main_diagonal([[1, 2], [3, 4]], [2, 3]).

test(single_answer, true(Answers == [[1, 4]])) :-
    findall(Result, main_diagonal([[1, 2], [3, 4]], Result), Answers).

test(compound_elements, true(Result == [f(1),f(2)])) :-
    main_diagonal([[f(1),a],[b,f(2)]], Result).

test(rectangular_matrix, [fail]) :-
    main_diagonal([[1,2,3],[4,5,6]], _).

test(uneven_rows, [fail]) :-
    main_diagonal([[1,2],[3]], _).

:- end_tests(main_diagonal).
