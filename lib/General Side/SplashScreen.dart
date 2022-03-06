import 'package:final_app/Faculty%20Side/Faculty%20Slider/FSliderDrawer.dart';
import 'package:final_app/HOD_Side/HOD_Slider/HSliderDrawer.dart';
import 'package:final_app/Student%20Side/Student_Slider/SSliderDrawer.dart';
import 'package:flutter/material.dart';

import '../slider/SliderDrawer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SliderDrawer()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              // Colors.yellow,
              Colors.lime,
              Colors.cyan,
              // Colors.indigo,
              // Colors.purpleAccent,
              // Colors.deepOrange,
            ],
          ),
        ),
        child: Center(
          child: Container(
            child: Image(
              image: AssetImage(
                'images/ss.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
