import 'dart:math';

class Robots {
  // map of the available robots and the functions associated with them
  static Map<String, int Function(int)> robots = {
    'random': randomBot,
    'impossible': impossibleBot,
    'cheater': cheaterBot
  };

  // randomly selects a number between 1 and 3
  static int randomBot(int total) {
    Random random = Random();
    int randomVal = random.nextInt(3) + 1;
    if (total + randomVal > 21) randomVal = 21 - total;
    return randomVal;
  }

  // does math stuff to find the best move usually trying to get to 17 to gaurantee a win and gets a gauranteed 17 by getting 13 and so forth
  static int impossibleBot(int total) {
    List<int> goals = [5, 9, 13, 17, 21];
    int? currentGoal;
    for (int g in goals) {
      if (total < g) {
        currentGoal = g;
        break;
      }
    }
    int amount = (currentGoal! - total);
    if (amount > 3) {
      return 1;
    } else {
      return amount;
    }
  }

  // well.. cheats
  static int cheaterBot(int total) {
    return 21 - total;
  }
}
