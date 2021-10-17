# Knight Travails

Determines and prints the fastest route for a knight to move between two locations on a chess board.

[Live demo](https://replit.com/@gregolive/Knight-Travails) 👈

## Functionality

- The knight_travails method accepts two [x,y] coordinate arrays, one for the starting location of the knight and the other for the ending location. The coordinates must correspond to an 8x8 chess board.
- To determine the optimal route, a tree is created using the knight's possible moves (staying both on the board and within the one movement range of a knight) beginning at the starting location and iterating out until the finishing location appears.
- After every iteration the moves of knight are searched using a depth first search algorithm since this matches the layer-like approach of branching the tree with possible moves and searching if the ending location.

## Reflection

At the start of this data structures project I quickly knew that breadth first search was ideal over depth first search, however the move tree construction stumped me for a while due to how quickly the size of the tree becomes with so many possible moves for a knight.

I began approaching the problem as I had with binary trees, first constructing the entire tree and then searching for the ending location. The sheer size of the tree quickly made this method inefficient, even when stopping the knight from revisiting a location on the board, and so I quickly began looking for a better alternative.

Unlike previous search tree's I have made that needed to be flexible to allow for repetitive search and reconstruction, understanding the static nature of a chessboard and the presence of only one search term prior to tree construction was crucial. With this in mind, a method that repeatedly adds another layer of moves and then immediately queues them for search made the most sense. There is likely more room for further efficiency improvements, however for a simple function like this I am happy with it in this state.