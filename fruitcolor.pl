% Facts
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(cherry, red).

% Backtracking rule to find the color of a fruit
color_of_fruit(Fruit, Color) :-
    fruit_color(Fruit, Color).

% Backtracking rule to find fruits of a specific color
fruits_of_color(Color, Fruits) :-
    findall(Fruit, fruit_color(Fruit, Color), Fruits).

% Example Queries
% 1. What is the color of an apple?
%    color_of_fruit(apple, Color).

% 2. What fruits are red?
%    fruits_of_color(red, RedFruits).
