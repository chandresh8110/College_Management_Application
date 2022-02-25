import 'package:final_app/Branch/BranchPage.dart';
import 'package:final_app/Student%20Side/Student%20Dart/StudentHomePage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_app/General%20Side/ChatRoom.dart';
import 'package:final_app/General%20Side/EventPage.dart';
import 'package:final_app/General%20Side/PlacementPage.dart';

class SBottomNaviPage extends StatefulWidget {
  const SBottomNaviPage({Key? key}) : super(key: key);

  @override
  _SBottomNaviPageState createState() => _SBottomNaviPageState();
}

class _SBottomNaviPageState extends State<SBottomNaviPage> {
  int index = 0;
  final screen = [
    SHomePage(),
    EventPage(),
    BranchPage(),
    PlacementPage(),
    ChatRoom(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.event, size: 30),
      Icon(Icons.ac_unit, size: 30),
      Icon(Icons.wallet_travel_outlined, size: 30),
      Icon(Icons.chat, size: 30),
    ];
    return Theme(
      data: Theme.of(context)
          .copyWith(iconTheme: IconThemeData(color: Colors.white)),
      child: Container(
        color: Colors.blue,
        child: SafeArea(
          top: false,
          child: ClipRRect(
            child: Scaffold(
              extendBody: true,
              // appBar: AppBar(
              //   leading: MenuWidget(),
              // ),
              body: screen[index],
              bottomNavigationBar: CurvedNavigationBar(
                color: Colors.blue,
                height: 60,
                animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                index: index,
                onTap: (index) => setState(() => this.index = index),
                items: items,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
