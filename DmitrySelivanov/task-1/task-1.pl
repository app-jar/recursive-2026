% Селиванов Д.А. 9 группа
% Задача 20
% Условие: Получить список элементов, стоящих на нечётных позициях исходного списка. 
% Позиции нумеруются начиная с 1.
% Пример: [10, 20, 30, 40, 50]. 
% Результат: [10, 30, 50].

odd_positions([], []).

odd_positions([H|T], [H|Res]) :-
    odd_positions(T, Res, even).

odd_positions(List, Result) :-
    odd_positions(List, Result, odd).

odd_positions([], [], _).

odd_positions([H|T], [H|Res], odd) :-
    odd_positions(T, Res, even).

odd_positions([_|T], Res, even) :-
    odd_positions(T, Res, odd).