import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_app/HOD_Side/HOD%20Dart/HODHomePage.dart';
import 'package:flutter/material.dart';
import '../../Branch/BranchPage.dart';
import '../../General Side/ChatRoom.dart';
import '../../General Side/EventPage.dart';
import '../../General Side/PlacementPage.dart';





class HBottomNaviPage extends StatefulWidget {
  const HBottomNaviPage({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _HBottomNaviPageState createState() => _HBottomNaviPageState();
}

class _HBottomNaviPageState extends State<HBottomNaviPage> {

  int index = 0;
  final screen = [
    HHomePage(username: ''),
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
