% Initial state: monkey is on the floor, banana is hanging, chair is not in use.
on_floor(monkey).
on_ceiling(banana).
not_in_use(chair).

% Actions that the monkey can perform
move(monkey, chair).
climb(monkey, chair).
reach(monkey, banana).

% Rules defining the state changes based on actions
can_reach(monkey, banana) :- on_floor(monkey), not_in_use(chair), on_ceiling(banana).
can_reach(monkey, banana) :- on_floor(monkey), not_in_use(chair), climb(monkey, chair), on_ceiling(banana).

% Goal state: monkey can reach the banana
goal :- can_reach(monkey, banana).

% Solve the problem by finding a sequence of actions leading to the goal
solve :- goal, write('Monkey can reach the banana.').

% Example query to solve the problem
:- solve.
