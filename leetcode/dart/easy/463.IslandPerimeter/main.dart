/* 
Attempt 2 at the problem/improved the previous solution to be more effecient.
Runtime: 534 ms - beats 33.33% of dart users.
Memory: 153.59 mb - beats 100% of dart users.
*/

class Solution {
  int islandPerimeter(List<List<int>> grid) {
    int borderingWater = 0;
    for (int row = 0; row < grid.length; row++){
      for (int column = 0; column < grid[row].length; column++){
        if (grid[row][column] == 0) continue;
        borderingWater+=4;
        // Checkes if the left and top cells are water and within bounds.
        if (row > 0 && grid[row-1][column] == 1) borderingWater -= 2;
        if (column > 0 && grid[row][column-1] == 1) borderingWater -=2;
      }
    }
    return borderingWater;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]));
}