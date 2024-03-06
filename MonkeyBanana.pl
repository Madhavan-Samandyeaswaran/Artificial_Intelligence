% Initial state
on_floor(monkey).
on_floor(chair).
on_floor(banana).

% Define initial state and goal
initial_state([on_floor(monkey), on_floor(chair), on_floor(banana)]).
goal_state([holding(monkey, banana)]).

% Actions
action(go_floor_to_chair, [on_floor(monkey), on_floor(banana), on_floor(chair)], [on_floor(monkey), on_floor(banana), on_chair(monkey)]).
action(climb_on_chair, [on_chair(monkey), on_floor(banana), on_chair(chair)], [on_chair(monkey), on_floor(banana), on_chair(chair)]).
action(grab_banana, [holding(monkey, nothing), on_floor(banana), on_chair(monkey)], [holding(monkey, banana), on_floor(banana), on_chair(monkey)]).
action(descend_with_banana, [holding(monkey, banana), on_chair(monkey), on_floor(nothing)], [holding(monkey, banana), on_floor(banana), on_floor(chair)]).

% Execute action
execute_action(Action, State, NewState) :-
    call(Action, State, NewState).

% Plan to achieve the goal
plan(InitialState, GoalState, Plan) :-
    find_plan([InitialState], GoalState, [], Plan).

find_plan(CurrentState, GoalState, _, []) :-
    subset(GoalState, CurrentState).

find_plan(CurrentState, GoalState, VisitedStates, [Action | RestOfPlan]) :-
    \+ member(CurrentState, VisitedStates),
    execute_action(Action, CurrentState, NewState),
    find_plan(NewState, GoalState, [CurrentState | VisitedStates], RestOfPlan).

% Example query:
% plan([on_floor(monkey), on_floor(chair), on_floor(banana)], [holding(monkey, banana)], Plan).
