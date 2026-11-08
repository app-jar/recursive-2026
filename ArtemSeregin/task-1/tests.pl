% ФИО: Серегин Артём Валерьевич.
% Лабораторная работа № 1. Вариант 27.
% Условие: вставить число после каждого вхождения указанного элемента.
% Проверка примера из задания и граничных случаев.

:- ensure_loaded('main.pl').
:- begin_tests(insert_after).

test(assignment_example, true(Result == [1, 2, 0, 3, 2, 0, 4])) :-
    insert_after([1, 2, 3, 2, 4], 2, 0, Result).

test(empty_list, true(Result == [])) :-
    insert_after([], 2, 0, Result).

test(no_matches, true(Result == [1, 3, 4])) :-
    insert_after([1, 3, 4], 2, 0, Result).

test(single_match, true(Result == [2, 0])) :-
    insert_after([2], 2, 0, Result).

test(first_and_last, true(Result == [2, 0, 1, 2, 0])) :-
    insert_after([2, 1, 2], 2, 0, Result).

test(adjacent_matches, true(Result == [2, 0, 2, 0, 2, 0])) :-
    insert_after([2, 2, 2], 2, 0, Result).

test(inserted_number_equals_target, true(Result == [2, 2, 2, 2])) :-
    insert_after([2, 2], 2, 2, Result).

test(atom_target, true(Result == [a, -1, b, a, -1])) :-
    insert_after([a, b, a], a, -1, Result).

test(exact_term_equality, true(Result == [2.0, 2, 0])) :-
    insert_after([2.0, 2], 2, 0, Result).

test(wrong_result, [fail]) :-
    insert_after([2, 2], 2, 0, [2, 0, 2]).

test(single_answer, true(Answers == [[2, 0, 1, 2, 0]])) :-
    findall(Result, insert_after([2, 1, 2], 2, 0, Result), Answers).

:- end_tests(insert_after).
