:- consult('task2-op18.pl').

:- begin_tests(op18).

test(example_from_task) :-
    once(op18([[1,2],[3,4]], R)),
    R == [[3,1],[4,2]].

test(matrix_3x3) :-
    once(op18([[1,2,3],[4,5,6],[7,8,9]], R)),
    R == [[7,4,1],[8,5,2],[9,6,3]].

test(matrix_1x1) :-
    once(op18([[5]], R)),
    R == [[5]].

test(identity_matrix) :-
    once(op18([[1,0,0],[0,1,0],[0,0,1]], R)),
    R == [[0,0,1],[0,1,0],[1,0,0]].

test(matrix_4x4) :-
    once(op18([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]], R)),
    R == [[13,9,5,1],[14,10,6,2],[15,11,7,3],[16,12,8,4]].

test(empty_matrix) :-
    once(op18([], R)),
    R == [].

test(single_element_matrix) :-
    once(op18([[42]], R)),
    R == [[42]].

:- end_tests(op18).