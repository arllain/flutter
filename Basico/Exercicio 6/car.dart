import '../Exercicio 4/vericle.dart';

class Car extends Vehicle {

  final String? brand;
  final String? model;
  final int? year;

  Car([this.brand = "Ford", this.model = "EcoSport", this.year= 2021]);

  @override
  void horn() => print("pom");

}