%Rule to move a single disk from one peg to another
move(1, Source, Target, _) :-
    write('Move disk 1 from '), write(Source), write(' to '), write(Target), nl.

% Rule to move N disks from Source to Target using Auxiliary peg
move(N, Source, Target, Auxiliary) :-
    N > 1,
    M is N - 1,
    move(M, Source, Auxiliary, Target), % Move M disks from Source to Auxiliary
    move(1, Source, Target, _),         % Move the remaining disk from Source to Target
    move(M, Auxiliary, Target, Source). % Move the M disks from Auxiliary to Target

% Rule to solve the Tower of Hanoi problem with N disks
tower_of_hanoi(N) :-
    move(N, 'peg A', 'peg C', 'peg B').

% Example usage:
% Call tower_of_hanoi with the number of disks, for example:
% ?- tower_of_hanoi(3).
