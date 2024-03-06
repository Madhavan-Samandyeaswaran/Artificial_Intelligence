% Best-First Search

% Define a simple graph with nodes, edges, and heuristic values
edge(a, b, 3).
edge(a, c, 2).
edge(b, d, 5).
edge(c, e, 4).
edge(d, f, 1).
edge(e, f, 7).

% Define heuristic values for nodes
heuristic(a, 7).
heuristic(b, 5).
heuristic(c, 8).
heuristic(d, 2).
heuristic(e, 3).
heuristic(f, 0).

% Best-First Search algorithm
best_first_search(Start, Goal, Path) :-
    best_first_search([node(Start, 0, 0, [])], Goal, Path).

% Base case: Goal node is reached
best_first_search([node(Goal, _, _, Path) | _], Goal, Path).

% Recursive case: Explore next nodes based on heuristic values
best_first_search([node(Current, _, _, Path) | Rest], Goal, FinalPath) :-
    findall(node(Next, Cost, Heuristic, [Next | Path]),
            (edge(Current, Next, Cost), heuristic(Next, Heuristic)),
            NextNodes),
    append(Rest, NextNodes, NewQueue),
    sort_queue(NewQueue, SortedQueue),
    best_first_search(SortedQueue, Goal, FinalPath).

% Sort the queue based on heuristic values
sort_queue(Queue, SortedQueue) :-
    predsort(compare_nodes, Queue, SortedQueue).

% Comparison predicate for sorting nodes based on heuristic values
compare_nodes(Order, node(_, _, H1, _), node(_, _, H2, _)) :-
    compare(Order, H1, H2).

% Example Query:
% best_first_search(a, f, Path).
