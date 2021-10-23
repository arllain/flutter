import 'dart:io';

main(List<String> args){
  const grades = [7, 7.5, 9, 6.5, 8.5, 3, 6, 9.5, 7.8, 8.75, 8.9, 10];
  var bestGrades = grades.where(isHightGrade);
  print(bestGrades);
}

bool isHightGrade(grade) => grade>8.5;