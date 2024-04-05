class Solution {
  int maxDepth(String s) {
    int biggestDepth = 0;
    int currentDepth = 0;
    for (String char in s.split('')) {
      if (char == '(') {
        currentDepth++;
      } else if (char == ')') {
        currentDepth--;
      }

      biggestDepth = currentDepth > biggestDepth ? currentDepth : biggestDepth;

    }
    return biggestDepth;
  }
}
