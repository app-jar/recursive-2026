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
count_occurrences(X, [_|T], Count) :- 
    count_occurrences(X, T, Count).

/* 
Пример ?- count_occurrences(3, [3, 2, 3, 4, 5], Count).
Вывод: Count = 2. 
Это верно!
*/

% Удаление дубликатов из списка
remove_duplicates([], []).
remove_duplicates([H|T], [H|Result]) :- 
    \+ member(H, T), 
    !, 
    remove_duplicates(T, Result).
remove_duplicates([H|T], Result) :- 
    remove_duplicates(T, Result).

/* 
Пример ?- remove_duplicates([3, 2, 3, 4, 5], Result).
Вывод: Result = [2, 3, 4, 5]. 
Это верно!
*/

% Создание списка пар [Число - Количество]
create_pairs([], _, []).
create_pairs([H|T], OriginalList, [H-Count|Result]) :-
    count_occurrences(H, OriginalList, Count),
    create_pairs(T, OriginalList, Result).

/* 
Пример ?- create_pairs([3, 2, 4, 5], [3, 2, 3, 4, 5], Result).
Вывод: Result = [3-2, 2-1, 4-1, 5-1].
Это верно!
*/

% Поиск минимального количества
min_count([_-F], F) :- !.
min_count([_-F|T], MinFreq) :-
    min_count(T, RestMin),
    (F < RestMin -> MinFreq = F ; MinFreq = RestMin).

/* 
Пример ?- min_count([3-2, 2-1, 4-1, 5-1], MinFreq).
Вывод: MinFreq = 1.
Это верно!
*/

% Главный предикат 
% (получаем список уникальных, для каждого числа из списка уникальных считаем кол-во вхождений в исх. списке, 
% находим мин. кол-во вхождений, собираем все числа, у которых кол-во вхождений равно минимальному)
rarely_occurring(List, Result) :-
    remove_duplicates(List, UniqueList),
    create_pairs(UniqueList, List, Pairs),
    min_count(Pairs, MinFreq),
    findall(Num, member(Num-MinFreq, Pairs), Result).
    
/*
Пример (из задачи): ?- rarely_occurring([2, 5, 2, 3, 5, 2, 4], Result).
Результат: Result = [3, 4].
Вывод верный
*/
