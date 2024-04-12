/* Loops through all values of tickets and updates them,
if the current index is the same as k it will check if it becomes 0,
lastly if the ticket becomes 0 it gets removed and indexes are updated accordingly. 
*/

class Solution {
  int timeRequiredToBuy(List<int> tickets, int k) {
    int time = 0;
    int index = 0;
    while (true) {
      print(tickets);
      int person = tickets[index];
      if (index == k) {
        print(tickets[index]);
        tickets[index] -= 1;
        time++;
        if (tickets[index] == 0) {
          return time;
        }
      } else if (person > 0) {
        tickets[index] -= 1;
        time++;
      } else if (person == 0) {
        tickets.removeAt(index);
        // If the index we are removing is before k then we also decrease k to match its new placement.
        k = k > index ? k - 1 : k;
        index--;
      }

      index++;
      if (index >= tickets.length) {
        index -= tickets.length;
      }
    }
  }
}

void main() {
  Solution sol = Solution();
  print(sol.timeRequiredToBuy([84, 49, 5, 24, 70, 77, 87, 8], 3));
}
