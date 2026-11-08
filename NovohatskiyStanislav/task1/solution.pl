% ФИО: Новохатский Станислав
% Лабораторная работа №1, Вариант 13
% Условие задачи: Определить наиболее часто встречающееся число в списке.

% Входной предикат: most_frequent(+List, -Result)
most_frequent([], none).
most_frequent([H|T], Result) :-
    count(H, [H|T], Count),
    most_frequent(T, H, Count, Result).

% Рекурсивный обход списка для поиска максимума:
% most_frequent(+List, +CurrentMaxElem, +CurrentMaxCount, -FinalResult)
most_frequent([], MaxElem, _, MaxElem).
most_frequent([H|T], MaxElem, MaxCount, Result) :-
    count(H, [H|T], Count),
    (   Count > MaxCount
    ->  most_frequent(T, H, Count, Result)
    ;   most_frequent(T, MaxElem, MaxCount, Result)
    ).

% Вспомогательный предикат подсчета вхождений элемента в список:
% count(+Element, +List, -Count)
count(_, [], 0).
count(X, [X|T], C) :- !, count(X, T, C1), C is C1 + 1.
count(X, [_|T], C) :- count(X, T, C).

% Точка входа для онлайн-компилятора:
:- initialization(main).

main :-
    most_frequent([2, 5, 2, 3, 5, 2, 4], X),
    write('Most frequent element is: '), write(X), nl.