%В примере в условии есть ошибка. При входных данных [1, 2, 3, 2, 4, 1, 5, 2] ответ должен быть [1], а не [1,2]
%так как в задании указано "которые встречаются в исходном списке РОВНО два раза", а 2 встречается в исх данных три раза
count_occurrences(_, [], 0).
count_occurrences(X, [X|T], N) :- count_occurrences(X, T, N1), N is N1 + 1.
count_occurrences(X, [H|T], N) :- X \= H, count_occurrences(X, T, N).

unique_elements([], []).
unique_elements([H|T], [H|Res]) :- \+ member(H, T), unique_elements(T, Res).
unique_elements([H|T], Res) :- member(H, T), unique_elements(T, Res).

exactly_two(List, Result) :-
    unique_elements(List, Uniques),
    findall(X, (member(X, Uniques), count_occurrences(X, List, 2)), Result).

test_empty :- exactly_two([], Result), Result == [].
test_no_duplicates :- exactly_two([1, 2, 3], Result), Result == [], format('Успех~n').
% test_duplicates :- exactly_two([1, 2, 1, 2], [1, 2]).
