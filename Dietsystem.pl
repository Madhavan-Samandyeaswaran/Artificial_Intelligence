% Facts
has_disease(john, diabetes).
has_disease(mary, hypertension).
has_disease(peter, high_cholesterol).

% Diet recommendations
diet_recommendation(diabetes, 'Low-carb, high-fiber diet with controlled sugar intake.').
diet_recommendation(hypertension, 'Low-sodium, high-potassium diet with emphasis on fruits and vegetables.').
diet_recommendation(high_cholesterol, 'Low-cholesterol, high-fiber diet with emphasis on lean proteins.').

% Rules
suggest_diet(Person, Diet) :-
    has_disease(Person, Disease),
    diet_recommendation(Disease, Diet).

% Queries
% 1. What diet is recommended for John's disease?
%    suggest_diet(john, Diet).

% 2. What diet is recommended for Mary's disease?
%    suggest_diet(mary, Diet).
