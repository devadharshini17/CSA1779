ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
parent(john, tom).
parent(mary, ann).
parent(mary, pat).
parent(pat, jim).
generate_ancestors :-
    ancestor(X, Y),
    assert(ancestor(X, Y)),
    fail.
generate_ancestors.
query1 :- ancestor(john, jim), write('Yes, John is an ancestor of Jim.').
query2 :- write('Ancestors of Ann: '), ancestor(X, ann), write(X), write(', '), fail.
query3 :- write('Descendants of Mary: '), ancestor(mary, X), write(X), write(', '), fail.

query4 :- ancestor(john, pat), write('Yes, Pat is a descendant of John.').

query5 :- write('Descendants of John: '), ancestor(john, X), write(X), write(', '), fail.
query6 :- write('Ancestors of Tom: '), ancestor(X, tom), write(X), write(', '), fail.
query7 :- parent(ann, pat), write('No, Ann is not a parent of Pat.').
query8 :- parent(jim, mary), write('No, Jim is not a parent of Mary.').
generate_ancestors.
