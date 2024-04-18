/* 
Loops through all elements in the 2d array and checks if they are land,
if so it will check its neighbors and if theyre water adds 1 to the,
borderingWater counter. 
Runtime: 732 ms - beats 33.33% of dart users.
Memory: 156.44 mb - beats 66.67% of dart users.
*/

class Solution {
  int islandPerimeter(List<List<int>> grid) {
    final List<List<int>> directions = [[-1, 0], [0, 1], [1, 0], [0, -1]];
    int borderingWater = 0;
    for (int row = 0; row < grid.length; row++){
      for (int column = 0; column < grid[row].length; column++){
        if (grid[row][column] == 0) continue;
        for (var direction in directions) {
          int seciontY = row - direction[0];
          int sectionX = column - direction[1];
          try {
            if (grid[seciontY][sectionX] == 0) borderingWater++;
          } catch(e) {
            borderingWater++;
          }
        }
      }
    }
    return borderingWater;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]));
}