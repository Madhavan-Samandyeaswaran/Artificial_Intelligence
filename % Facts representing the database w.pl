% Facts representing the database with name and date of birth (DOB)
dob(john, '1990-05-15').
dob(mary, '1985-08-22').
dob(jane, '1995-03-10').
dob(bob, '1980-11-28').
dob(susan, '1998-09-05').

% Query to retrieve the date of birth for a given person
get_dob(Person, DOB) :- dob(Person, DOB).

% Query to check if two people have the same date of birth
same_dob(Person1, Person2) :- dob(Person1, DOB), dob(Person2, DOB), Person1 \= Person2.
