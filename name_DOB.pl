%facts about indivuduals and dob
dob(john, date(1990,5,15)).
dob(marry, date(1985,10,25)).
dob(david, date(2000,3,8)).
% querry to find dob
query_dob(Name,DOB):-
    dob(Name, DOB).
