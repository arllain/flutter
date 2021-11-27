import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/repositories/favorites_plant_repository.dart';
import 'package:challenge_ui_plant_app/repositories/plant_repository.dart';
import 'package:challenge_ui_plant_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'l10n/l10n.dart';
import 'screens/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

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
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
                debugShowCheckedModeBanner: false, home: SplashScreen());
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: L10.all,
              title: 'Plant App',
              theme: ThemeData(
                primaryColor: kPrimaryColor,
                scaffoldBackgroundColor: kBackgroundColor,
                textTheme:
                    Theme.of(context).textTheme.apply(bodyColor: kTextColor),
              ),
              home: const HomeScreen(),
            );
          }
        });
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(microseconds: 2500));
  }
}
