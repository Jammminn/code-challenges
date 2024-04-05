class Solution {
  List<String> findRelativeRanks(List<int> scores) {
    List<int> sortedScores = List.from(scores)..sort((a, b) => b.compareTo(a));
    // Created a instead of a list so that the program doesnt need to constantly search for the index of a element.
    Map<int, String> sortedScoreMap = sortedScores.asMap().map((index, score) {
      String placement;
      switch (index) {
        case 0:
          {
            placement = 'Gold Medal';
          }
          break;
        case 1:
          {
            placement = 'Silver Medal';
          }
          break;
        case 2:
          {
            placement = 'Bronze Medal';
          }
          break;
        default:
          {
            placement = (index + 1).toString();
          }
      }

      return MapEntry(score, placement);
    });

    List<String> scoreResults = [];
    for (int score in scores) {
      scoreResults.add(sortedScoreMap[score]!);
    }

    return scoreResults;
  }
}
