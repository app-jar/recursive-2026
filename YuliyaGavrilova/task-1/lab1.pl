% Гаврилова Юлия Олеговна
% Лабораторная работа № 1
% Задача № 4:
% Условие: Выполнить симметричный переворот списка.
% Вход: список чисел.

% Вспомогательный предикат с аккумулятором: rev_acc(ИсходныйСписок, Аккумулятор, Результат)
rev_acc([], Acc, Acc).
rev_acc([H|T], Acc, Res) :-
    rev_acc(T, [H|Acc], Res).

% Основной предикат для пользователя
symmetric_reverse(List, RevList) :-
    rev_acc(List, [], RevList).

% Тесты:
% my_reverse([1, 2, 3, 4], X).
% my_reverse([a, b, c], X).
% my_reverse([5], X).
% my_reverse([], X).
% my_reverse([10, 20, 30, 40, 50], X).
% my_reverse([hello, world, prolog], X).
