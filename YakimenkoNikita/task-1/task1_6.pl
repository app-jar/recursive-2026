% Якименко Никита Сергеевич
% Лабораторная работа 1
% Вход: список элементов. Первый и второй элементы меняются местами, затем третий и
% четвёртый и т. д.

swap_pairs([], []).
swap_pairs([X], [X]).
swap_pairs([X, Y | T], [Y, X | R]) :-
    swap_pairs(T, R).

test :-
    swap_pairs([1, 2, 3, 4, 5], [2, 1, 4, 3, 5]),
    swap_pairs([1, 2, 3, 4], [2, 1, 4, 3]),
    swap_pairs([], []),
    swap_pairs([a], [a]),
    swap_pairs([a, b], [b, a]),
    swap_pairs([a, b, c], [b, a, c]),
    write('Все тесты пройдены'), nl.

:- initialization(main).

main :-
    swap_pairs([1, 2, 3, 4, 5], R),
    write(R), nl,
    test.