abstract class Vehicle{
  int _currentSpeed = 5;

  void horn();

  void acelerate(int speed){
    if (speed >= _currentSpeed) {
      print("You are over Speed limit. Please, for your safety slow down to speed limit of 5");
    }else {
      print("You're in the speed limit");
    }
  }

}
