class Solution {
  String makeGood(String s) {
    // The function loops through the string and if a bad set of characters is found, skips them otherwise appends them to the new string.
    // Once it is done looping through s it calls itself and passes greatString, this continues until greatString is the same as the passed string.
    String greatString = '';
    int i = 0;
    while (i < s.length - 1) {
      String char = s[i];
      String nextChar = s[i + 1];
      if (char.toLowerCase() == nextChar.toLowerCase() && char != nextChar) {
        i += 2;
      } else {
        greatString += char;
        i++;
      }
    }
    greatString += i < s.length ? s[s.length - 1] : '';
    return greatString.length == s.length
        ? greatString
        : this.makeGood(greatString);
  }
}

void main() {
  Solution sol = Solution();
  print(sol.makeGood("leEeetcode"));
}
