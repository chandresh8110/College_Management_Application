// ignore_for_file: must_be_immutable

import 'package:final_app/General%20Side/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'General Side/MyThemes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color _primaryColor = HexColor('#FF00BCD4');
  Color _accentColor = HexColor('#FFCDDC39');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        //title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: _primaryColor,
          scaffoldBackgroundColor: Colors.grey.shade100,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
              .copyWith(secondary: _accentColor),
          textTheme: GoogleFonts.vollkornTextTheme(
            Theme.of(context).textTheme,
          )),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      );
}
