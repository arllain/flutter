import 'dart:io';

main() {
  print("Type an integer number :");
  final numberValue = int.parse(stdin.readLineSync()!);

  print("Type 1 for ascending order or 0 for descending order:");
  final ascOrder = stdin.readLineSync() != "1" ? true : false;

  drawTriangle(numberValue, ascOrder);
}

void drawTriangle(int numberValue, [bool ascOrder = false]) {
  String result = "";
  int startNum = ascOrder ? numberValue : 1;
  while (true) {
    result += getLine(startNum);
    startNum += ascOrder ? -1 : 1;
    if (startNum == 0 || startNum > numberValue) break;
  }
  print(result);
}

String getLine(int value) {
  String line = "";
  for (int i = 0; i < value; i++) line += "*";
  line += "\n";
  return line;
}
