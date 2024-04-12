class Solution {
  String makeGood(String sentence) {
    // This is a second attempt at the problem to see if i can make it faster.
    // The function loops through the string once instead of doing multiple runs like the first solution.
    // It works by checking if the previous character is a bad pair with the current character and if so, remove it otherwise add it to the list.
    List<String> greatString = [];
    for (String char in sentence.split('')) {
      if (greatString.isNotEmpty &&
          greatString.last.toUpperCase() == char.toUpperCase() &&
          greatString.last != char) {
        greatString.removeLast();
      } else {
        greatString.add(char);
      }
    }
    return greatString.join('');
  }
}

void main() {
  Solution sol = Solution();
  print(sol.makeGood("leEeetcode"));
}
