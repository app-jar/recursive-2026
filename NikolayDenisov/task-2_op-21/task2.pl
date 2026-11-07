% edge_count(+Vertices, +Edges, -Count)
% Count - количество рёбер неориентированного графа.
edge_count(_, Edges, Count) :-
    count_elements(Edges, 0, Count).

% count_elements(+List, +Acc, -Count)
% Рекурсия с накопителем (хвостовая): считает элементы списка.
count_elements([], Acc, Acc).
count_elements([_|Tail], Acc, Count) :-
    Acc1 is Acc + 1,
    count_elements(Tail, Acc1, Count).

