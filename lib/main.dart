// ignore: depend_on_referenced_packages
// ignore_for_file: use_key_in_widget_constructors

//packages;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//providers
import '/provider/workout.dart';
import '/provider/anaylsis.dart';
import '/provider/nutrition.dart';
import '/provider/bottombar.dart';

//screens
import '/screens/home.dart';
import '/screens/meal.dart';
import '/screens/tabs.dart';
import '/screens/login.dart';
import '/screens/signup.dart';
import '/screens/landing.dart';
import '/screens/profile.dart';
import '/screens/workouts.dart';
import 'screens/nutritions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => WorkoutProvider()),
        ChangeNotifierProvider(create: (ctx) => AnalysisProvider()),
        ChangeNotifierProvider(create: (ctx) => NutritionProvider()),
        ChangeNotifierProvider(create: (ctx) => BottomAppBarProvider()),
      ],
      child: MaterialApp(
        home: LandingScreen(),
        routes: {
          TabScreen.routeName: (contex) => TabScreen(),
          MealScreen.routeName: (contex) => MealScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          SignupScreen.routeName: (context) => SignupScreen(),
          WorkoutScreen.routeName: (contex) => WorkoutScreen(),
          ProfileScreen.routeName: (contex) => ProfileScreen(),
          NutritionScreen.routeName: (context) => NutritionScreen(),
        },
      ),
    );
  }
}
