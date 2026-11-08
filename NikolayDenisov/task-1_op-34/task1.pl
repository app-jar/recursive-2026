/*
Денисов Николай 9 группа
Лабораторная № 1 задача 34

Условие:
Объединить два списка, чередуя их элементы.
Если списки имеют разную длину, оставшиеся элементы более длинного списка дописываются
в конец.

Пример: [1, 2, 3] и [a, b, c].
Результат: [1, a, 2, b, 3, c].


Примеры тестов для запуска вручную:

alternating_merge([a,b,c], [1,2], Result).

alternating_merge([], [x,y], Result).

alternating_merge([a,b], [], Result).

alternating_merge([a,b,c], [1], Result).

можешь их скопировать и вставить,когда будешь лабу проверять, на работоспособность
Заранее спасибо за review!
*/

alternating_merge([], Ys, Ys).
alternating_merge([X|Xs], Ys, [X|Result]) :-
    alternating_merge(Ys, Xs, Result).

