% Symptoms for different medical conditions
symptom(fever, flu).
symptom(cough, flu).
symptom(sore_throat, flu).
symptom(headache, flu).

symptom(fever, cold).
symptom(cough, cold).
symptom(runny_nose, cold).

symptom(fatigue, covid_19).
symptom(cough, covid_19).
symptom(fever, covid_19).
symptom(shortness_of_breath, covid_19).

% Rules for medical diagnosis
diagnose_patient(Patient, Condition) :-
    has_symptoms(Patient, Symptoms),
    determine_condition(Symptoms, Condition).

has_symptoms(Patient, Symptoms) :-
    write('Enter symptoms for '), write(Patient), write(': '), nl,
    read(Symptoms).

determine_condition(Symptoms, Condition) :-
    member(Symptom, Symptoms),
    symptom(Symptom, Condition),
    write('Patient likely has '), write(Condition), nl.

% Example Query:
% diagnose_patient(john, Condition).
