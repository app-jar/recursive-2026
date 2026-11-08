% Останков Иван Александрович
% Лабораторная работа №1
% Вариант 5
% Условие задачи: Проверить симметричность списка.
% Вход: список элементов. Пример: [1, 2, 3, 2, 1].
% Результат: да.

% Входной предикат: symmetric(+List)
% Список симметричен, если он совпадает со своим обращением.
symmetric(List) :-
    reverse_list(List, List).

% Вспомогательный предикат обращения списка:
% reverse_list(+List, -Reversed)
reverse_list([], []).
reverse_list([H|T], Reversed) :-
    reverse_list(T, RT),
    concat(RT, [H], Reversed).

% Вспомогательный предикат склеивания списков:
% concat(+List1, +List2, -Result)
concat([], L, L).
concat([H|T], L, [H|R]) :- concat(T, L, R).

% Вывод результата в формате "да" / "нет":
% check(+List)
check(List) :- symmetric(List), !, write('да'), nl.
check(_) :- write('нет'), nl.

% Вывод входных данных и результата:
% test_case(+List)
test_case(List) :-
    write(List), write(' -> '),
    check(List).

:- initialization(main).

main :-
    test_case([1, 2, 3, 2, 1]),      % да
    test_case([1, 2, 2, 1]),         % да
    test_case([1, 2, 3]),            % нет
    test_case([1, 2, 3, 1]).         % нет