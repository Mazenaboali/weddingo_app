import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weddingo/ui/Hall_direction_widget.dart';
import 'package:weddingo/ui/hall_details_screen.dart';
import 'firebase_options.dart';
import 'package:weddingo/ui/home_screen.dart';
import 'package:weddingo/ui/splash_screen.dart';
void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SplashScreen.routeName:(_)=>SplashScreen(),
        HallDetailsScreen.routeName:(_)=>HallDetailsScreen(),
        HallDirection.routeName:(_)=>HallDirection()
      },
      initialRoute: SplashScreen.routeName
    );
  }
}

