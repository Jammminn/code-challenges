/* 
Finally slightly improved the loops, 
It seems that saving the lenght of the grid is faster although it seems that 
the submission stats seem to vary significantly but seems to be on average faster.
Runtime: 321 ms - beats 100% of dart users.
Memory: 151.94 mb - beats 100% of dart users.
*/

class Solution {
  int numIslands(List<List<String>> grid) {
    int islands = 0;
    final int rows = grid.length;
    final int cols = grid[0].length;

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (grid[i][j] == '1') {
          islands++;
          _exploreIsland(grid, i, j);
        }
      }
    }

    return islands;
  }

  void _exploreIsland(List<List<String>> grid, int row, int col) {
    if (row < 0 ||
        row >= grid.length ||
        col < 0 ||
        col >= grid[0].length ||
        grid[row][col] != '1') {
      return;
    }

    grid[row][col] = '0'; // Marking visited

    _exploreIsland(grid, row + 1, col); // Explore down
    _exploreIsland(grid, row - 1, col); // Explore up
    _exploreIsland(grid, row, col + 1); // Explore right
    _exploreIsland(grid, row, col - 1); // Explore left
  }
}

void main() {
  Solution sol = Solution();
  print(sol.numIslands([
    ["1", "1", "1", "1", "0"],
    ["1", "1", "0", "1", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "0", "0", "0"]
  ]));
}
