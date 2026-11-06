:- consult('task1-op31.pl').

:- begin_tests(op31).

test(example_from_task) :-
    once(op31([1, 2, 3, 4], [2, 4, 7], R)),
    R == [1, 3].

test(empty_first_list) :-
    once(op31([], [1, 2, 3], R)),
    R == [].

test(empty_second_list) :-
    once(op31([1, 2, 3], [], R)),
    R == [1, 2, 3].

test(both_lists_empty) :-
    once(op31([], [], R)),
    R == [].

test(all_elements_removed) :-
    once(op31([1, 2, 3], [3, 2, 1], R)),
    R == [].

test(no_elements_removed) :-
    once(op31([1, 2, 3], [4, 5, 6], R)),
    R == [1, 2, 3].

test(duplicates_are_preserved) :-
    once(op31([1, 2, 1, 3, 1], [2], R)),
    R == [1, 1, 3, 1].

test(order_preserved) :-
    once(op31([5, 4, 3, 2, 1], [4, 2], R)),
    R == [5, 3, 1].

test(atoms) :-
    once(op31([a, b, c], [b], R)),
    R == [a, c].

:- end_tests(op31).