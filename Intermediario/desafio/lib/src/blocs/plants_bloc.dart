import 'package:challenge_ui_plant_app/src/models/plant.dart';
import 'package:challenge_ui_plant_app/src/repositories/plant_repository.dart';
import 'package:rxdart/rxdart.dart';

class PlantsBloc {
  final _plantRepository = PlantRepository();
  final _plantsFetcher = PublishSubject<List<Plant>>();

  Stream<List<Plant>> get allPlants => _plantsFetcher.stream;

  fetchAllPlants() async {
    List<Plant> allPlants = await _plantRepository.fetchAllPlants();
    _plantsFetcher.sink.add(allPlants);
  }

  dispose() {
    _plantsFetcher.close();
  }
}

final bloc = PlantsBloc();
