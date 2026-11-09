% Гаврилова Юлия Олеговна
% Лабораторная работа № 2
% Задача № 31:
% Условие: Проверить правильность расстановки круглых скобок в арифметическом выражении.
% Вход: Строка, содержащая круглые скобки и символы арифметического выражения.
% Пример: (a+b)*(c-d).
% Результат: Да. 
% Для строки (a+b)) результат — нет.

% Главный предикат: принимает строку и проверяет скобки
check_brackets(Str) :-
    string_chars(Str, Chars),
    validate(Chars, 0).

validate([], 0).

% Встретили открывающую скобку
validate(['(' | T], Count) :-
    NewCount is Count + 1,
    validate(T, NewCount).

% Встретили закрывающую скобку
validate([')' | T], Count) :-
    Count > 0,
    NewCount is Count - 1,
    validate(T, NewCount).

% Встретили любой другой символ
validate([H | T], Count) :-
    H \= '(',
    H \= ')',
    validate(T, Count).

% Тесты:
% ?- check_brackets("(a+b)*(c-d)").
% ?- check_brackets("(a+b))").
% ?- check_brackets("a + (b * (c - d)").
% ?- check_brackets("((a))").
% ?- check_brackets(")a+b(").
