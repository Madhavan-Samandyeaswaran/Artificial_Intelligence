% Base case: Sum of integers from 1 to 0 is 0
sum_integers(0, 0).

% Recursive rule: Sum of integers from 1 to n is Sum1 + n, where Sum1 is the sum of integers from 1 to n-1
sum_integers(N, Sum) :-
    N > 0,
    N1 is N - 1,
    sum_integers(N1, Sum1),
    Sum is Sum1 + N.
