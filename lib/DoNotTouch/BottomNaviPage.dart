import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_app/General%20Side/AccountPage.dart';
import 'package:final_app/General%20Side/EventPage.dart';
import 'package:final_app/General%20Side/MainPage.dart';
import 'package:final_app/General%20Side/PlacementPage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomNaviPage extends StatefulWidget {
  const BottomNaviPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BottomNaviPage> {
  int index = 0;
  final screen = [
    MainPage(),
    EventPage(),
    PlacementPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.event, size: 30),
      Icon(Icons.wallet_travel_outlined, size: 30),
      Icon(Icons.login, size: 30),
    ];
    return Theme(
      data: Theme.of(context)
          .copyWith(iconTheme: IconThemeData(color: Colors.black)),
      child: Container(
        color: Colors.blue,
        child: SafeArea(
          top: false,
          child: ClipRRect(
            child: Scaffold(
              extendBody: true,
              body: screen[index],
              bottomNavigationBar: CurvedNavigationBar(
                color: HexColor("#CCCCCC"),
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
