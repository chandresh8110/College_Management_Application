import 'package:final_app/slider/SliderDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => ZoomDrawer.of(context)!.toggle(),
      ),
      onWillPop: () async {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => SliderDrawer()),
        // );
        return true;
      },
    );
  }
}
