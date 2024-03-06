% Facts
student(john).
student(mary).
student(peter).

teacher(prof_smith).
teacher(prof_jones).

subject(math).
subject(english).

% Rules
teaches(prof_smith, math).
teaches(prof_jones, english).

enrolled(john, math).
enrolled(mary, english).
enrolled(peter, math).

% Queries
teaching_subject(Teacher, Subject) :-
    teacher(Teacher),
    teaches(Teacher, Subject).

enrolled_in_subject(Student, Subject) :-
    student(Student),
    enrolled(Student, Subject).
