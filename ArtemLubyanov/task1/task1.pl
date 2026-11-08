%Лубянов Артем Андреевич
%Лабораторная 1
%Вариант 33
%Объединить два списка, сохранив порядок первого появления
%элементов и исключив повторения.

merge_unique(List1, List2, Result) :-
    my_unique_acc(List1, [], Acc1),
    my_unique_acc(List2, Acc1, Result).

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
% merge_unique([1, 2, 3, 2], [3, 4, 1, 5], X).
%      ответ: X = [1, 2, 3, 4, 5]

% merge_unique([1, 1, 2], [2, 3, 3, 4], X).
%      ответ: X = [1, 2, 3, 4]

% merge_unique([], [1, 2, 1], X).
%      ответ: X = [1, 2]

% merge_unique([5, 4, 3], [], X).
%      ответ: X = [5, 4, 3]

% merge_unique([], [], X).
%      ответ: X = []

% merge_unique([1, 2], [1, 2], X).
%      ответ: X = [1, 2]