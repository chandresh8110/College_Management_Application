import 'package:final_app/Course/Course_Selection_FP.dart';
import 'package:final_app/New_Layout/Both/NEW_COURSE_LAYOUT.dart';
import 'package:final_app/New_Layout/Both/NEW_PUBLISH_LAYOUT.dart';
import 'package:final_app/New_Layout/Both/NEW_STUDENT_MAIN_LAYOUT.dart';
import 'package:final_app/New_Layout/FAC-HOD/NEW_ATTENDANCE_MAIN_LAYOUT.dart';
import 'package:final_app/New_Layout/header_widget_homePages.dart';
import 'package:final_app/Profile/HOD_Setting_Page.dart';
import 'package:flutter/material.dart';
import '../../General Side/theme_helper.dart';
import '../FAC-HOD/NEW_EXAM_LAYOUT.dart';
import '../HOD-ADMIN/NEW_FACULTY_MAIN_LAYOUT.dart';

class New_H_Homepage extends StatefulWidget {
  const New_H_Homepage({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<New_H_Homepage> createState() => _New_H_HomepageState();
}

class _New_H_HomepageState extends State<New_H_Homepage> {
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
                            height: 150,
                          ),
                          Center(
                            child: Text(
                              "Student",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                            'https://cdn-icons-png.flaticon.com/512/906/906175.png',
                            height: 150,
                          ),
                          Text(
                            "Faculty",
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
                          builder: (context) => New_Faculty_Layout(
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
                            height: 150,
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
                            height: 150,
                          ),
                          Text(
                            "Course",
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
                            height: 150,
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
                          builder: (context) => New_Publish_Layout(
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
                            'https://cdn-icons-png.flaticon.com/512/327/327010.png',
                            height: 150,
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
                            height: 150,
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
                          builder: (context) => HOD_Setting_page(
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
