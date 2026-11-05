/*
Протопопов Иван Олегович
Номер 28
Условие: Удалить из списка все элементы, которые встречаются более одного раза.

Примеры тестов для запуска:

remove_duplicates([1, 2, 3, 2, 4, 1, 5], Result).
remove_duplicates([], Result).
remove_duplicates([a, a, a], Result).
remove_duplicates([1, 2, 3], Result).
remove_duplicates([1, 2, 1, 2], Result).
*/

% Главный предикат
remove_duplicates(InList, ResultList) :-
    process_list(InList, InList, ResultList).

% Базовый случай
process_list([], _, []).

% Рекурсивный случай: если элемент уникален, оставляем его
process_list([H|T], FullList, [H|RestResult]) :-
    count_occurrences(H, FullList, Count),
    Count =:= 1,
    process_list(T, FullList, RestResult).

% Рекурсивный случай: если элемент повторяется, пропускаем его
process_list([H|T], FullList, Result) :-
    count_occurrences(H, FullList, Count),
    Count =\= 1,
    process_list(T, FullList, Result).

% Подсчет вхождений элемента в список
count_occurrences(_, [], 0).

count_occurrences(X, [X|T], Count) :-
    count_occurrences(X, T, RestCount),
    Count is RestCount + 1.

count_occurrences(X, [H|T], Count) :-
    X \= H,
    count_occurrences(X, T, Count).
