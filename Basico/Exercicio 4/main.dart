import 'car.dart';
import 'motorcicle.dart';
import 'vericle.dart';

main() {

  Vehicle car = new Car();
  car.horn();
  car.acelerate(20);

  print("--------------------------------");

  Vehicle motorCicle = new MotorCicle();
  motorCicle.horn();
  car.acelerate(7);
}