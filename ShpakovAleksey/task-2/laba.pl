% Вспомогательный предикат для извлечения элемента из списка
% (аналог встроенного select/3)
take_out(X, [X | Rest], Rest).
take_out(X, [Head | Tail], [Head | Rest]) :-
    take_out(X, Tail, Rest).

% Генерация одного размещения длины K из списка
arrangement(_, 0, []).
arrangement(List, K, [X | TailArrangement]) :-
    K > 0,
    take_out(X, List, RestList),     % Выбираем элемент X и получаем оставшийся список
    K1 is K - 1,
    arrangement(RestList, K1, TailArrangement). % Рекурсивно собираем остальные элементы

% Основной предикат, собирающий все размещения в итоговый список
all_arrangements(List, K, Result) :-
    findall(Arr, arrangement(List, K, Arr), Result).
