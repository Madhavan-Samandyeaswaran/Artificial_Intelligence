% Facts
bird(robin).
bird(sparrow).
bird(penguin).
bird(ostrich).

can_fly(robin).
can_fly(sparrow).
cannot_fly(penguin).
cannot_fly(ostrich).

% Rules
flies(Bird) :-
    can_fly(Bird).

does_not_fly(Bird) :-
    cannot_fly(Bird).

% Queries
% 1. Which birds can fly?
%    flies(Bird).

% 2. Which birds cannot fly?
%    does_not_fly(Bird).
