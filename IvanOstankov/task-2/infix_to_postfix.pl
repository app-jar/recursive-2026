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
    TopPriority >= Priority, !,
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


% Входной предикат: infix_to_postfix(+Expr, -Postfix)
% Преобразует строку Expr в инфиксной записи в постфиксную.
infix_to_postfix(Expr, Postfix) :-
    atom_chars(Expr, Chars),
    convert(Chars, [], [], Result),
    atom_chars(Postfix, Result).

% Обход символов слева направо:
% convert(+Chars, +Stack, +Out, -Result)
% Stack - стек операций, Out - выход в обратном порядке.

% Конец строки: выталкиваем остаток стека и разворачиваем выход
convert([], Stack, Out, Result) :-
    pop_all(Stack, Out, Full),
    rev(Full, [], Result).

% Открывающая скобка: кладём в стек
convert(['('|T], Stack, Out, Result) :- !,
    convert(T, ['('|Stack], Out, Result).

% Закрывающая скобка: выталкиваем операции до "("
convert([')'|T], Stack, Out, Result) :- !,
    pop_until_paren(Stack, Out, NewStack, NewOut),
    convert(T, NewStack, NewOut, Result).

% Операция: выталкиваем операции с приоритетом >= текущего, кладём текущую.
% Знак ">=" даёт левую ассоциативность: a-b-c = (a-b)-c
convert([Op|T], Stack, Out, Result) :-
    op_prec(Op, Priority), !,
    pop_ops(Stack, Priority, Out, Stack1, Out1),
    convert(T, [Op|Stack1], Out1, Result).

% Переменная: сразу в выход
convert([V|T], Stack, Out, Result) :-
    convert(T, Stack, [V|Out], Result).
    
% Вывод входных данных и результата:
% test_case(+Expr)
test_case(Expr) :-
    infix_to_postfix(Expr, Postfix),
    write(Expr), write(' -> '), write(Postfix), nl.

% Точка входа для онлайн-компилятора:
:- initialization(main).

main :-
    % Основные случаи
    test_case('a+b*c'),              % abc*+
    test_case('a*b+c'),              % ab*c+
    test_case('(a+b)*c'),            % ab+c*
    test_case('a*(b+c)-d/e'),        % abc+*de/-

    % Операции одного приоритета: левая ассоциативность
    test_case('a-b-c'),              % ab-c-
    test_case('a+b-c'),              % ab+c-
    test_case('a/b*c'),              % ab/c*
    test_case('a-(b-c)'),            % abc--

    % Особые случаи
    test_case('a'),                  % a
    test_case('(a)'),                % a
    test_case('((a+b))').            % ab+