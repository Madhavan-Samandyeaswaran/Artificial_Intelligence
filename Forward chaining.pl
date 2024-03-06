% Define facts and rules
bird(tweety).
bird(penguin).
flies(X) :- bird(X), not(penguin(X)).

% Initialize the working memory with known facts
fact(tweety).

% Forward chaining algorithm
forward_chain :- repeat,
    (new_fact(F), assert_fact(F), write('New fact derived: '), write(F), nl, fail ; true).

% Rules to derive new facts
new_fact(Flies) :- flies(X), not(fact(X)), assertz(fact(X)), Flies = flies(X).

% Queries
goal :- write('Can it fly?'), nl, (fact(tweety) -> write('Yes, it can fly.'); write('No, it cannot fly.')), nl.

% Start forward chaining
:- forward_chain.

% Query the goal
:- goal.
