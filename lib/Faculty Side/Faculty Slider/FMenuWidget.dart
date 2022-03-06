import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'FSliderDrawer.dart';

class FMenuWidget extends StatelessWidget {
  const FMenuWidget({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => ZoomDrawer.of(context)!.toggle(),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FSliderDrawer(
              username: '$username',
            ),
          ),
        );
        return false;
      },
    );
  }
}
