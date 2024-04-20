/* 
Improved the explore island method to be much more effecient,
Runtime: 305 ms - beats 100% of dart users.
Memory: 152.46 mb - beats 100% of dart users.
*/

class Solution {
  int numIslands(List<List<String>> grid) {
    int islands = 0;
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        String section = grid[i][j];
        if (section == '1') {
          islands++;
          _exploreIsland(grid, i, j);
        }
      }
    }

    return islands;
  }

void _exploreIsland(List<List<String>> grid, int row, int col) {
  if (row < 0 || row >= grid.length || col < 0 || col >= grid[0].length || grid[row][col] != '1') {
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
