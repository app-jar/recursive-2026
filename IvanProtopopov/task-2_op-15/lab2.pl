/*
Протопопов Иван Олегович
Номер 15
Условие: Получить список элементов побочной диагонали квадратной матрицы.

Примеры тестов для запуска:

secondary_diagonal([[1,2,3],[4,5,6],[7,8,9]], Result).
secondary_diagonal([[1,2],[3,4]], Result).
secondary_diagonal([[1]], Result).
secondary_diagonal([], Result).
*/

% Главный предикат
secondary_diagonal(Matrix, Result) :-
    secondary_diagonal(Matrix, Result, 0).

% Базовый случай: если матрица пуста, результат пуст
secondary_diagonal([], [], _).

% Рекурсивный случай
secondary_diagonal([Row|RestRows], [Element|RestResult], Index) :-
    % Находим длину Row
    length(Row, Len),
    TargetIndex is Len - 1 - Index,
    % Ищем в списке Row элемент под номером TargetIndex
    nth0(TargetIndex, Row, Element),
    NextIndex is Index + 1,
    secondary_diagonal(RestRows, RestResult, NextIndex).
