%% $ swipl -t main -q -f xxxxx

%:-use_module(library(matrix)).
%:- use_module(library(matrix)).
:- dynamic edge/2.
%%assertaasserta(+Term)(+Term)


main :- go.

go :-
    get_Maze(Maze, Lines, Rows),
	print_Map(Maze),
	num_Lines(Maze, Lines),
	num_Rows(Maze, Rows),
    format("\n SIZE: ~d: ~d", [Lines, Rows]),
	grid_Atom_Lists(Maze, Lines, L),
	nl,
	write(L),nl,
	print_Map(L).


%%generate_edges([H|L], Lines, Rows) :-






   
%%% a list of atom
get_Maze(Maze, Lines, Rows) :-
    File ="inp1.txt",
    open(File , read, Str),
    read_file(Str , Maze),
    close(Str),
	%%% print_Map(Maze),
	num_Lines(Maze, Lines),
	num_Rows(Maze, Rows).
    %format("\n SIZE: ~d: ~d", [Lines, Rows]),
	%nl.

read_file(Stream,[]) :-
    at_end_of_stream(Stream),!.

%%% comes a list of atoms ... avoiding EOF
read_file(Stream, [C|L]) :-
    \+ at_end_of_stream(Stream),
    read_line_to_codes(Stream, X), 
    atom_codes(C, X),
	format("\n Line: ~w", [C]),
    read_file(Stream , L).

print_Map([]).
print_Map([C | L ]) :-
    % atom_length( C , Leng),
	% format("\n Line: ~w ~d", [C, Leng]),
    format("\n  ~w ", [C]),
    print_Map(L).

%% OK
num_Lines([],0).
num_Lines([ _ | L ], N) :-
     num_Lines( L , N1),
	 N is N1 + 1.

%%
num_Rows( [H|_] , X ) :-
    atom_length( H , X ).

%%% transform a atom sequence in a List ..
%% here Grid in list of list
grid_Atom_Lists(_, 0, []).
grid_Atom_Lists([M1|Maze], Lines, [H|L]) :-
    atom_chars(M1, H), %% an atom sequence in a list
	L_new is Lines -1,
	grid_Atom_Lists(Maze, L_new, L).


/*

size_of_Map([H|L], X, Y) :-
     atom_length(H, X ),
	 atom_length([H|L], All),
	 Y is All / X ,
	 format("\n SIZE: ~d: ~d: ~d", [X,Y,All]).
*/	
