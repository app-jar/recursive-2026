%Крылова Татьяна Владимировна, номер 29
%Получить список элементов, которые встречаются в исходном списке ровно два раза.
%Вход: список элементов.
%Пример: [1, 3, 2, 4, 1, 5, 2].
%Результат: [1, 2].

count_occurrences(_, [], 0).
count_occurrences(X, [X|T], N) :- count_occurrences(X, T, N1), N is N1 + 1.
count_occurrences(X, [H|T], N) :- X \= H, count_occurrences(X, T, N).

unique_elements([], []).
unique_elements([H|T], [H|Res]) :- \+ member(H, T), unique_elements(T, Res).
unique_elements([H|T], Res) :- member(H, T), unique_elements(T, Res).
