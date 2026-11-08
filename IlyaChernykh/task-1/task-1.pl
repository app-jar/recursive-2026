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