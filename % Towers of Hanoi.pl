% Towers of Hanoi
hanoi(1, A, _, C, Moves) :-
    format('Move disk 1 from ~w to ~w~n', [A, C]),
    Moves = 1.

hanoi(N, A, B, C, Moves) :-
    N > 1,
    M is N - 1,
    hanoi(M, A, C, B, Moves1),
    format('Move disk ~w from ~w to ~w~n', [N, A, C]),
    hanoi(M, B, A, C, Moves2),
    Moves is Moves1 + Moves2 + 1.

