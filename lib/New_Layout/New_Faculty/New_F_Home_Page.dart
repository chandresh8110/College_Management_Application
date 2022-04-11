
import 'package:final_app/Marks/Faculty_Marks_view_FP.dart';
import 'package:final_app/New_Layout/FAC-HOD/NEW_ATTENDANCE_MAIN_LAYOUT.dart';
import 'package:final_app/Profile/Faculty_Setting_Page.dart';
import 'package:flutter/material.dart';
import 'package:final_app/New_Layout/header_widget_homePages.dart';

import '../../General Side/theme_helper.dart';
import '../Both/NEW_COURSE_LAYOUT.dart';
import '../Both/NEW_STUDENT_MAIN_LAYOUT.dart';
import '../FAC-HOD/NEW_EXAM_LAYOUT.dart';

class New_F_Homepage extends StatefulWidget {
  const New_F_Homepage({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<New_F_Homepage> createState() => _New_F_HomepageState();
}

class _New_F_HomepageState extends State<New_F_Homepage> {
  double _headerHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: _headerHeight,
            child: HeaderWidget(
              _headerHeight,
              true,
              username: widget.username,
            ), //let's create a common header widget
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                primary: false,
                children: [
                  InkWell(
                    child: Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: Column(
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/512/3135/3135755.png',
                            height: 140,
                          ),
                          Text(
                            "Student",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => New_Student_Layout(
                            username: widget.username,
                          ),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: Column(
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/512/3125/3125913.png',
                            height: 140,
                          ),
                          Text(
                            "Attendance",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => New_Attendance_Layout(
                            username: widget.username,
                          ),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: Column(
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/512/2097/2097068.png',
                            height: 140,
                          ),
                          Text(
                            "Course",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => New_Course_Layout(
                            username: widget.username,
                          ),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: Column(
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/512/1378/1378644.png',
                            height: 140,
                          ),
                          Text(
                            "Publish",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              Faculty_Marks_view_FP(username: widget.username),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: Column(
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/512/3319/3319660.png',
                            height: 140,
                          ),
                          Text(
                            "Exam",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => New_Exam_Layout(
                            username: widget.username,
                          ),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: Column(
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/512/1589/1589526.png',
                            height: 140,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Faculty_Setting_page(
                            username: widget.username,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
