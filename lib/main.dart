import 'package:final_app/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'MyThemes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
      //title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme:MyThemes.darkTheme,
      home: SplashScreen(),

      debugShowCheckedModeBanner: false,
    );

}


