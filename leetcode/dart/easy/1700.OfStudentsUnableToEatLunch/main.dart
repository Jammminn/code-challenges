// Not a very effecient way to do this question, if i have time later i may attempt to make it more effecient.

class Solution {
  int countStudents(List<int> students, List<int> sandwiches) {
    int stackSize = 0;
    List<int> newStudents = [];

    while (stackSize != students.length && sandwiches.isNotEmpty) {
      stackSize = students.length;
      newStudents.clear();
      for (int student in students) {
        // loop through students and whatever students can take sandwhiches will and the ones who cant will join the newStudents list.
        if (student == sandwiches[0]) {
          sandwiches.removeAt(0);
        } else {
          newStudents.add(student);
        }
      }
      // to copy the list and not the reference point.
      students = [...newStudents];
    }
    return students.length;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.countStudents([1, 1, 1, 0, 0, 1], [1, 0, 0, 0, 1, 1]));
}
