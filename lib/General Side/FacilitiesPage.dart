import 'package:final_app/Facilities/Industrial_visit.dart';
import 'package:final_app/Facilities/InfrastructurePage.dart';
import 'package:final_app/Facilities/SportsPage.dart';
import 'package:final_app/slider/MenuWidget.dart';
import 'package:flutter/material.dart';

import '../slider/SliderDrawer.dart';

class FacilitiesPage extends StatelessWidget {
  const FacilitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  // backgroundColor: Colors.blue,
                  floating: true,
                  pinned: true,
                  title: Text('Facilities'),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.cyanAccent,
                          Colors.blue,
                        ],
                      ),
                    ),
                  ),
                  leading: MenuWidget(),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Infrastructure'),
                      Tab(text: 'Industrial_visit'),
                      Tab(text: 'Sports'),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                Infrastructure(),
                IndustrialVisit(),
                SportPage(),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SliderDrawer(),
          ),
        );
        return false;
      },
    );
  }
}
