% Facts
male(john).
male(bob).
male(tom).
male(jerry).

female(alice).
female(lisa).
female(emma).

% Relationships
parent(john, bob).
parent(john, lisa).
parent(alice, bob).
parent(alice, lisa).
parent(bob, tom).
parent(lisa, jerry).
parent(tom, emma).

% Rules
father(Father, Child) :-
    male(Father),
    parent(Father, Child).

mother(Mother, Child) :-
    female(Mother),
    parent(Mother, Child).

sibling(Sibling1, Sibling2) :-
    parent(Parent, Sibling1),
    parent(Parent, Sibling2),
    Sibling1 \= Sibling2.

% Queries
% 1. Who are the children of John?
%    parent(john, Child).

% 2. Is Lisa a sibling of Bob?
%    sibling(lisa, bob).

% 3. Who is the father of Jerry?
%    father(Father, jerry).
