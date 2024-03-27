import 'dart:math';

String disariumNumber(int n) {
  List<String> nList = n.toString().split('');
  num newNum = 0;
  for (int i = 1; i <= nList.length; i++) {
    newNum += pow(int.parse(nList[i-1]), i);
  }
  return n == newNum? 'Disarium !!' : 'Not !!';
}

void main() {
  print(disariumNumber(89));
  print(disariumNumber(564));
}

