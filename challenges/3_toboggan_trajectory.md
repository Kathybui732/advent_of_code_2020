# With the toboggan login problems resolved, you set off toward the airport. While travel by toboggan might be easy, it's certainly not safe: there's very minimal steering and the area is covered in trees. You'll need to see which angles will take you near the fewest trees.

Due to the local geology, trees in this area only grow on exact integer coordinates in a grid. You make a map (your puzzle input) of the open squares (.) and trees (#) you can see. For example:

|..##.......
|#...#...#..
|.#....#..#.
|..#.#...#.#
|.#...##..#.
|..#.##.....
|.#.#.#....#
|.#........#
|#.##...#...
|#...##....#
|.#..#...#.#
These aren't the only trees, though; due to something you read about once involving arboreal genetics and biome stability, the same pattern repeats to the right many times:

|..##.........##.........##.........##.........##.........##.......  --->
|#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..
|.#....#..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.
|..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#
|.#...##..#..#...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
|..#.##.......#.##.......#.##.......#.##.......#.##.......#.##.....  --->
|.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
|.#........#.#........#.#........#.#........#.#........#.#........#
|#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...
|#...##....##...##....##...##....##...##....##...##....##...##....#
|.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#  --->
You start on the open square (.) in the top-left corner and need to reach the bottom (below the bottom-most row on your map).

The toboggan can only follow a few specific slopes (you opted for a cheaper model that prefers rational numbers); start by counting all the trees you would encounter for the slope right 3, down 1:

From your starting position at the top-left, check the position that is right 3 and down 1. Then, check the position that is right 3 and down 1 from there, and so on until you go past the bottom of the map.

The locations you'd check in the above example are marked here with O where there was an open square and X where there was a tree:

|..##.........##.........##.........##.........##.........##.......  --->
|#..O#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..
|.#....X..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.
|..#.#...#O#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#
|.#...##..#..X...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
|..#.##.......#.X#.......#.##.......#.##.......#.##.......#.##.....  --->
|.#.#.#....#.#.#.#.O..#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
|.#........#.#........X.#........#.#........#.#........#.#........#
|#.##...#...#.##...#...#.X#...#...#.##...#...#.##...#...#.##...#...
|#...##....##...##....##...#X....##...##....##...##....##...##....#
|.#..#...#.#.#..#...#.#.#..#...X.#.#..#...#.#.#..#...#.#.#..#...#.#  --->
In this example, traversing the map using this slope would cause you to encounter 7 trees.

Starting at the top-left corner of your map and following a slope of right 3 and down 1, how many trees would you encounter?

------------------------------------------

## What is the problem asking?
Starting from the left-top most point, we are going to be moving down the grid, 3 over and one down. Doing this through the whole map, we need to figure out how many trees or # we hit.

## What assumptions can we make?
- The only obstacle are the trees

## What kind of problem is this?
A grid problem
A math problem

## Data Type to use
An array will should work - this way we can iterate over each of the rows. We can put the data into a csv and turn it into an array of strings.

If the transversing becomes over 3 down 2, then we would want to add a counter or maybe take in the dataset as a hash so that we can keep track of what row we're on.

## Initial thoughts
For now, because the slope is over 3 down 1, we really only have to look at the run (x value) and not so much the rise (y value going down). So, we would only have to iterate through the array.

We always start at (1,1)

We could iterate over the array, have a counter that keeps track of what row we're on.
We could keep track of the number of times we have to multiply the row from the following equation:
- We should have x and y values for the run and rise of the slope
- We have a size of each of the rows

# Pseudo code
We will have an if statement to figure out which rows to check:
We should have a
We should only check the row if (row - 1) % y == 0
Number of times each row needs to be repeated = (row * x)/size of row
Then we are going to check the value at the coordinate (row - 1) * x
If that value == # then += 1 tree count

So += 1 tree count if (row - 1) % y == 0 && row[(row - 1) * x] == "X"
