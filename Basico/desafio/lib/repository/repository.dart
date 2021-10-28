
import 'package:desafio/model/item.dart';
import 'package:desafio/utils/utils.dart';

class Repository {

  getData() {
    return List.generate(1000, (index) =>
        Item(++index,  Utils.generateRandomString(10), Utils.generateRandomEnabledState()));
  }
}