/*
Реутов Никита Алексеевич

Номер 14

Условие: Найти самый редкий элемент (элементы) в списке.

Примеры тестов для запуска:

rarest([1, 2, 3, 2, 4, 1, 5], Result). //[3, 4, 5]
rarest([], Result).  //[]
rarest([1, 2, 3], Result). //[1,2,3]
rarest([1, 1, 1], Result). //[1]
*/
% Строит список пар "Элемент-Количество", где каждый элемент встречается один раз.
frequencies([], []).
frequencies([H|T], [H-N|Rest]) :-
    count_occurrences(H, [H|T], N),
    remove_all(H, T, T1),         
    frequencies(T1, Rest).

% Считает, сколько раз заданный элемент встречается в списке.
count_occurrences(_, [], 0).
count_occurrences(X, [X|T], N) :-
    count_occurrences(X, T, N0),
    N is N0 + 1.
count_occurrences(X, [Y|T], N) :-
    X \= Y,
    count_occurrences(X, T, N).


% Удаляет из списка все вхождения заданного элемента.
remove_all(_, [], []).
remove_all(X, [X|T], R) :- !, remove_all(X, T, R).
remove_all(X, [H|T], [H|R]) :- remove_all(X, T, R).

%Основной предикат 
% Находит элемент (или элементы), который встречается в списке реже всего.
rarest(List, Result) :-
    frequencies(List, Pairs),       
    min_count(Pairs, MinN),          
    collect_by_count(Pairs, MinN, Result). 


% Находит минимальное значение частоты среди всех пар.
min_count([_-C|Rest], Min) :-
    min_count(Rest, C, Min).

min_count([], Acc, Acc).
min_count([_-C|Rest], Acc, Min) :-
    Acc1 is min(Acc, C),
    min_count(Rest, Acc1, Min).


% Собирает все элементы из списка пар, у которых частота равна заданной.
collect_by_count(Pairs, N, Elems) :-
    findall(E, member(E-N, Pairs), Elems).