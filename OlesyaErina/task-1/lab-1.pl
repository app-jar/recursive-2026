% Ерина О.С 9 группа
% задача 12
% Проверить, является ли список повторением одного и того же списка N раз.


% Вспомогательный предикат для повторения списка N раз
repeat_list(_, 0, []) :- !.
repeat_list(List, N, Result) :-
    N > 0,
    N1 is N - 1,
    repeat_list(List, N1, Tail),
    append(List, Tail, Result).