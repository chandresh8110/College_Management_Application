import 'package:flutter/material.dart';
import '../slider/SliderDrawer.dart';
import 'BE.dart';
import 'DE.dart';
import '../slider/MenuWidget.dart';

class BranchPage extends StatelessWidget {
  const BranchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  // backgroundColor: Colors.blue,
                  floating: true,
                  pinned: true,
                  title: Text('BranchPage'),
                  leading: MenuWidget(),
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
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Bachelor of Engineering'),
                      Tab(text: 'Diploma Engineering'),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                BE(),
                DE(),
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
