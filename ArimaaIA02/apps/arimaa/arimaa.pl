:- module(bot,
      [  get_moves/3
      ]).
	
% A few comments but all is explained in README of github

% get_moves signature
% get_moves(Moves, gamestate, board).

% Exemple of variable

% gamestate: [side, [captured pieces] ] (e.g. [silver, [ [0,1,rabbit,silver],[0,2,horse,silver] ]) 

% board: [[0,0,rabbit,silver],[0,1,rabbit,silver],[0,2,horse,silver],[0,3,rabbit,silver],[0,4,elephant,silver],[0,5,rabbit,silver],[0,6,rabbit,silver],[0,7,rabbit,silver],[1,0,camel,silver],[1,1,cat,silver],[1,2,rabbit,silver],[1,3,dog,silver],[1,4,rabbit,silver],[1,5,horse,silver],[1,6,dog,silver],[1,7,cat,silver],[2,7,rabbit,gold],[6,0,cat,gold],[6,1,horse,gold],[6,2,camel,gold],[6,3,elephant,gold],[6,4,rabbit,gold],[6,5,dog,gold],[6,6,rabbit,gold],[7,0,rabbit,gold],[7,1,rabbit,gold],[7,2,rabbit,gold],[7,3,cat,gold],[7,4,dog,gold],[7,5,rabbit,gold],[7,6,horse,gold],[7,7,rabbit,gold]]

% Call exemple:

% get_moves(Moves, [silver, []], [[0,0,rabbit,silver],[0,1,rabbit,silver],[0,2,horse,silver],[0,3,rabbit,silver],[0,4,elephant,silver],[0,5,rabbit,silver],[0,6,rabbit,silver],[0,7,rabbit,silver],[1,0,camel,silver],[1,1,cat,silver],[1,2,rabbit,silver],[1,3,dog,silver],[1,4,rabbit,silver],[1,5,horse,silver],[1,6,dog,silver],[1,7,cat,silver],[2,7,rabbit,gold],[6,0,cat,gold],[6,1,horse,gold],[6,2,camel,gold],[6,3,elephant,gold],[6,4,rabbit,gold],[6,5,dog,gold],[6,6,rabbit,gold],[7,0,rabbit,gold],[7,1,rabbit,gold],[7,2,rabbit,gold],[7,3,cat,gold],[7,4,dog,gold],[7,5,rabbit,gold],[7,6,horse,gold],[7,7,rabbit,gold]]).

% default call

get_moves([[[1,0],[2,0]],[[0,0],[1,0]],[[0,1],[0,0]],[[0,0],[0,1]]], Gamestate, Board).


%FAITS

win():- % L ennemi n a plus de lapin ou si un de ses lapins est sur la dernière ligne.



isStronger(elephant,X):- X \= elephant.
isStronger(camel,X):- X \= camel, X \= elephant.
isStronger(horse,X) :- X \= horse, X \= camel, X \= elephant.
isStronger(dog,X) :- X \= dog , X \= horse, X \= camel, X \= elephant.
isStronger(cat,X) :- X \= cat, X \= dog , X \= horse, X \= camel, X \= elephant.

isOpponent(silver,gold).
isOpponent(gold,silver).

PieceSide(horseS,silver).
PieceSide(elephantS,silver).
PieceSide(rabbitS, silver).
PieceSide(camelS,silver).
PieceSide(dogS,silver).
PieceSide(catS,silver).
PieceSide(horseG,gold).
PieceSide(elephantG,gold).
PieceSide(rabbitG, gold).
PieceSide(camelG,gold).
PieceSide(dogG,gold).
PieceSide(catG,gold).

PieceName(horseS,horse).
PieceName(horseG,horse).
PieceName(elephantS,elephant).
PieceName(elephantG,elephant).
PieceName(catS,cat).
PieceName(catG,cat).
PieceName(dogS,dog).
PieceName(dogG,dog).
PieceName(rabbitG,rabbit).
PieceName(rabbitS,rabbit).
PieceName(camelG,camel).
PieceName(camelS,camel).

killed()
nextTo(X,Y) :- 
nextToEnnemy(X,Y) :-nextTo(X,Y),PieceSide(X,Cx),PieceSide(Y,Cy), isOpponent(Cx,Cy).
nextToFriend(X,Y) :- nextTo(X,Y),PieceSide(X,C),PieceSide(Y,C).
frozen(X,Y):- nextToEnnemy(X,Y), isStronger(Y,X), \+nextToFriend(X,Z).

 












