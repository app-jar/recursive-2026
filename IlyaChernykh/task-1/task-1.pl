%Черных Илья Михайлович
%Лабораторная 1
%Вариант 8
%Получить список, содержащий все элементы исходного списка, но по одному.

my_unique(List, Result) :-
    my_unique_acc(List, [], Result).

my_unique_acc([], Acc, Acc).

my_unique_acc([H|T], Acc, Result) :-
    (   member(H, Acc)->
        my_unique_acc(T, Acc, Result);
        append(Acc, [H], NewAcc),
        my_unique_acc(T, NewAcc, Result)
    ).

member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

append([], L, L).
append([H|T], L, [H|R]) :- append(T, L, R).

% Тесты:
% my_unique([1, 2, 1, 3, 2, 1], X).
%      ответ: X = [1, 2, 3]

%my_unique([2, 1, 3, 2, 1], X).
%      ответ: X = [2, 1, 3]

% my_unique([1, 2, 3, 4], X).
%      ответ: X = [1, 2, 3, 4]

% my_unique([], X).
%      ответ: X = []

% my_unique([5, 5, 5], X).
%      ответ: X = [5]