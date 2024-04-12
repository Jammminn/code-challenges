/* 
Works by adding all the water possible from left to right, 
then removes all the excess water for right to left.
Runtime: 357ms - beats 71.05% of dart users.
Memory: 150.16 mb - beats 73.68% of dart users. 
*/

class Solution {
  int trap(List<int> height) {
    List<int> caughtWater = [];

    // Adds the water.
    int highestPeak = 0;
    for (int i = 0; i < height.length; i++) {
      int heightVal = height[i];
      if (heightVal > highestPeak) highestPeak = heightVal;
      caughtWater.add(highestPeak - heightVal);
    }

    // Removes excess water.
    highestPeak = 0;
    for (int i = height.length - 1; i >= 0; i--) {
      int heightVal = height[i];
      int waterLevel = caughtWater[i];
      if (heightVal > highestPeak) highestPeak = heightVal;
      if (heightVal + waterLevel > highestPeak)
        caughtWater[i] = highestPeak - heightVal;
    }

    return caughtWater.reduce((value, element) => value + element);
  }
}

void main() {
  Solution sol = Solution();
  print(sol.trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]));
}
