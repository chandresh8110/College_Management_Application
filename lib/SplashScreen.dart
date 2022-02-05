import 'package:final_app/Student%20Side/Student_Slider/SSliderDrawer.dart';
import 'package:flutter/material.dart';


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

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 600),() {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SSliderDrawer()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Container(
          child: Image(image: AssetImage('images/ss.png'),),
        ),
      ),
    );
  }
}
