%Черных Илья Михайлович
%Лабораторная работа 2
% Задача 35: Перевод числа из десятичной системы в B-ричную (2 <= B <= 16)
% Результат: список цифр от старшей к младшей

convert_to_base(N, B, Result) :-
    N >= 0, B >= 2, B =< 16,
    base_acc(N, B, [], Result).

base_acc(0, _, Acc, Result) :- 
    Acc \= [], !, Result = Acc.
base_acc(0, _, [], [0]).

base_acc(N, B, Acc, Result) :-
    N > 0,
    Remainder is N mod B,
    NextN is N // B,
    base_acc(NextN, B, [Remainder | Acc], Result).

my_reverse([], []).
my_reverse([H|T], R) :- my_reverse(T, RT), my_append(RT, [H], R).

my_append([], L, L).
my_append([H|T], L, [H|R]) :- my_append(T, L, R).
