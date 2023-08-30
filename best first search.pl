node(a, 10, [b, c]).
node(b, 8, [d, e]).
node(c, 5, [f]).
node(d, 6, []).
node(e, 4, []).
node(f, 3, []).
best_first_search(Start, Goal, Path) :-
    best_first_search([[Start]], Goal, Path).

best_first_search([[Node|Path]|_], Node, [Node|Path]).
best_first_search([Path|Paths], Goal, FinalPath) :-
    extend(Path, NewPaths),
    append(Paths, NewPaths, CombinedPaths),
    sort_paths(CombinedPaths, SortedPaths),
    best_first_search(SortedPaths, Goal, FinalPath).

extend([Node|Path], NewPaths) :-
    node(Node, _, Neighbors),
connected(a, b).
connected(a, c).
connected(b, d).
connected(b, e).
connected(c, f).
connected(c, g).
connected(d, h).
connected(e, i).

% BFS implementation
bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, PathRev),
    reverse(PathRev, Path).

% Base case: Goal node is reached
bfs_queue([[Goal|Path]|_], Goal, [Goal|Path]).

% Recursive case: Explore neighboring nodes
bfs_queue([[Node|Path]|Paths], Goal, FinalPath) :-
    findall([Neighbor,Node|Path], (connected(Node, Neighbor), \+ member(Neighbor, [Node|Path])), NewPaths),
    append(Paths, NewPaths, UpdatedPaths),
    bfs_queue(UpdatedPaths, Goal, FinalPath).

% Entry point for querying the BFS
find_bfs_path(Start, Goal, Path) :-
    bfs(Start, Goal, Path).
