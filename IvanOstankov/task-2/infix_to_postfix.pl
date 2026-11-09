% Останков Иван Александрович
% Лабораторная работа №2
% Вариант 32
% Условие задачи: Преобразовать инфиксную запись выражения в постфиксную
% с учётом приоритета операций и скобок.
% Вход: Список токенов; операнды — целые числа, операторы — '+', '-', '*', '/'. Для примера деление целочисленное.
% Пример: a+b*c.
% Результат: abc*+.

% Приоритет операций: 1 - низкий (+, -), 2 - высокий (*, /):
% op_prec(+Op, -Priority)
op_prec('+', 1).
op_prec('-', 1).
op_prec('*', 2).
op_prec('/', 2).

% Вытолкнуть из стека в выход все операции с приоритетом
% Остановка на "(" (для неё нет op_prec) или на пустом стеке:
% pop_ops(+Stack, +Priority, +Out, -NewStack, -NewOut)
pop_ops([Top|Stack], Priority, Out, NewStack, NewOut) :-
    op_prec(Top, TopPriority),
    TopPriority > Priority, !,
    pop_ops(Stack, Priority, [Top|Out], NewStack, NewOut).
pop_ops(Stack, _, Out, Stack, Out).

% Вытолкнуть из стека в выход все операции до "(", саму "(" удалить:
% pop_until_paren(+Stack, +Out, -NewStack, -NewOut)
pop_until_paren(['('|Stack], Out, Stack, Out) :- !.
pop_until_paren([Op|Stack], Out, NewStack, NewOut) :-
    pop_until_paren(Stack, [Op|Out], NewStack, NewOut).

% Вытолкнуть весь стек в выход:
% pop_all(+Stack, +Out, -Result)
pop_all([], Out, Out).
pop_all([Op|Stack], Out, Result) :-
    pop_all(Stack, [Op|Out], Result).

% Обращение списка с аккумулятором:
% rev(+List, +Acc, -Reversed)
rev([], Acc, Acc).
rev([H|T], Acc, Reversed) :- rev(T, [H|Acc], Reversed).