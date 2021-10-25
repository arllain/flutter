import '../Exercicio 4/vericle.dart';
import 'autonomous.dart';

class Car extends Vehicle with Autonomous {

  @override
  void horn() {
    print("pom");
  }
}