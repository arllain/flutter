import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/repositories/favorites_plant_repository.dart';
import 'package:challenge_ui_plant_app/repositories/plant_repository.dart';
import 'package:challenge_ui_plant_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PlantRepository()),
      ChangeNotifierProvider(create: (_) => FavoritesPlantRepository()),
    ],
    child: const PlantApp(),
  ));
}

class PlantApp extends StatelessWidget {
  const PlantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      ),
      home: const HomeScreen(),
    );
  }
}
