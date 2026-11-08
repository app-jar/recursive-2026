preorder(nil, []).
preorder(node(Value, Left, Right), [Value|Rest]) :-
    preorder(Left, LeftList),
    preorder(Right, RightList),
    append(LeftList, RightList, Rest).