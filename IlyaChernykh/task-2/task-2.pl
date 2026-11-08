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


% ТЕСТЫ ДЛЯ ПРОВЕРКИ
% 
% 1. Пример из задания (25 в двоичную)
% convert_to_base(25, 2, X).
%      ответ: X = [1, 1, 0, 0, 1]
%
% 2. Перевод в восьмеричную систему (100 в 8-ричную)
% convert_to_base(100, 8, X).
%      ответ: X = [1, 4, 4]
%
% 3. Перевод в шестнадцатеричную систему (255 в 16-ричную)
% convert_to_base(255, 16, X).
%      ответ: X = [15, 15] (в Prolog цифры больше 9 остаются числами)
%
% 4. Краевой случай: число 0
% convert_to_base(0, 10, X).
%      ответ: X = [0]
%
% 5. Краевой случай: число 1
% convert_to_base(1, 2, X).
%      ответ: X = [1]
%
% 6. Защита от неверного основания (основание 1)
% convert_to_base(10, 1, X).
%      ответ: false
%
% 7. Защита от неверного основания (основание 17)
% convert_to_base(10, 17, X).
%      ответ: false
