import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'HSliderDrawer.dart';

class HMenuWidget extends StatelessWidget {
  const HMenuWidget({Key? key, required this.username}) : super(key: key);

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
              builder: (context) => HSliderDrawer(
                    username: '$username',
                  )),
        );
        return false;
      },
    );
  }
}
