% ФИО: Зайцев Глеб Александрович
% Лабораторная работа №1
% Вариант 23
% Условие: проверить, чередуются ли в списке
% четные и нечетные числа.
% Вход: список целых чисел.
% Пример: [2, 5, 8, 3, 10].
% Результат: true.
% Пустой список и список из одного элемента
% не нарушают условие чередования.
alternating([]).
alternating([X]) :-
    integer(X).
alternating([A, B | Tail]) :-
    integer(A),
    integer(B),
    A mod 2 =\= B mod 2,
    alternating([B | Tail]).
% Тестовые случаи
test_correct :- alternating([2, 5, 8, 3, 10]).
test_incorrect :- \+ alternating([2, 4, 7]).
test_negative :- alternating([-2, 3, -4, 7]).
test_empty :- alternating([]).
test_single :- alternating([5]).