/* 
Works by going through all sections and if land is found increases island counter,
then "explores" the island turning it to water so that it wont accidentally be counted again.
Runtime: 422 ms - beats 23.08% of dart users.
Memory: 187 mb - beats 23.08% of dart users.
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

  void _exploreIsland(List<List<String>> island, int locationY, int locationX) {
    final List<List<int>> directions = [[1, 0], [0, 1], [-1, 0], [0, -1]];
    if (island[locationY][locationX] == '0') return;
    island[locationY][locationX] = '0';
    for (List<int> direction in directions) {
      try {
        _exploreIsland(island, locationY + direction[0], locationX + direction[1]);
      } catch (e) {

      }
    }
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
