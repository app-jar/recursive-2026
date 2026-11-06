/*
Колесникова Алёна Николаевна, лабораторная работа № 1, вариант 14
Определить наиболее редко встречающееся число в списке.
Вход: список чисел.
Пример: [2, 5, 2, 3, 5, 2, 4].
Результат: 3 или 4.
*/

% Подсчет количества вхождений элемента X в список
count_occurrences(_, [], 0).
count_occurrences(X, [X|T], Count) :- 
    !, 
    count_occurrences(X, T, RestCount), 
    Count is RestCount + 1.
count_occurrences(X, [Y|T], Count) :- 
    count_occurrences(X, T, Count).

% Удаление дубликатов из списка
remove_duplicates([], []).
remove_duplicates([H|T], [H|Result]) :- 
    \+ member(H, T), 
    !, 
    remove_duplicates(T, Result).
remove_duplicates([H|T], Result) :- 
    remove_duplicates(T, Result).

% Создание списка пар [Число - Количество]
create_pairs([], _, []).
create_pairs([H|T], OriginalList, [H-Count|Result]) :-
    count_occurrences(H, OriginalList, Count),
    create_pairs(T, OriginalList, Result).

% Поиск минимального количества
min_count([_-F], F) :- !.
min_count([_-F|T], MinFreq) :-
    min_count(T, RestMin),
    (F < RestMin -> MinFreq = F ; MinFreq = RestMin).
