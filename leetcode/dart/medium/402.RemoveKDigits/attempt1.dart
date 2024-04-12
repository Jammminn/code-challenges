/* the code works by finding the smallest value that is in range of removal and removes everything before it and repeats but this is inefficient */

class Solution {
  String removeKdigits(String num, int k) {
    String smallestPossible = '';
    int remainingRemovals = k;
    List<int> numList = num.split('').map((String s) => int.parse(s)).toList();

    while (remainingRemovals < numList.length && remainingRemovals != 0) {
      int smallestDigit = 10;
      int potentialRemovals = 0;
      for (int i = 0; i < remainingRemovals + 1; i++) {
        int currentNumber = numList[i];
        if (currentNumber < smallestDigit) {
          smallestDigit = currentNumber;
          potentialRemovals = i;
        }
      }
      numList.removeRange(0, potentialRemovals + 1);
      smallestPossible += smallestDigit.toString();
      remainingRemovals -= potentialRemovals;
    }
    if (remainingRemovals >= numList.length) {
      numList.clear();
    }
    String fullNum = (smallestPossible + numList.join('')).replaceAll(RegExp('^0+'), '');
    return fullNum.isEmpty ? '0' : fullNum;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.removeKdigits(banana, 50000));
}
