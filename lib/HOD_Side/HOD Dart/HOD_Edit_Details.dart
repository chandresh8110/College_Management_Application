import 'package:final_app/Search/Faculty_HOD_Search.dart';
import 'package:final_app/Search/Student_HOD_Search.dart';
import 'package:flutter/material.dart';

import '../HOD_Slider/HMenuWidget.dart';
import '../HOD_Slider/HSliderDrawer.dart';

class HOD_Edit_Details extends StatefulWidget {
  const HOD_Edit_Details({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<HOD_Edit_Details> createState() => _HOD_Edit_DetailsState();
}

class _HOD_Edit_DetailsState extends State<HOD_Edit_Details> {
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
                  title: Text('Search Details'),
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
                  leading: HMenuWidget(
                    username: '${widget.username}',
                  ),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Search Student'),
                      Tab(text: 'Search Faculty'),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                Student_HOD_Search(
                  username: '${widget.username}',
                ),
                Faculty_HOD_Search(
                  username: '${widget.username}',
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HSliderDrawer(
              username: '${widget.username}',
            ),
          ),
        );
        return false;
      },
    );
  }
}
