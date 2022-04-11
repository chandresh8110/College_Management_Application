import 'package:flutter/material.dart';
import 'package:final_app/New_Layout/header_widget_homePages.dart';

import '../../Add_Data/Add_Student.dart';
import '../Both/NEW_COURSE_LAYOUT.dart';
import '../Both/NEW_STUDENT_MAIN_LAYOUT.dart';
import '../HOD-ADMIN/NEW_FACULTY_MAIN_LAYOUT.dart';

class New_A_Homepage extends StatefulWidget {
  const New_A_Homepage({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<New_A_Homepage> createState() => _New_A_HomepageState();
}

class _New_A_HomepageState extends State<New_A_Homepage> {
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
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              primary: false,
              children: [
                InkWell(
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/3135/3135755.png',
                          height: 160,
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
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/906/906175.png',
                          height: 160,
                        ),
                        Text(
                          "Faculty",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
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
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/2097/2097068.png',
                          height: 160,
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
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/1378/1378644.png',
                          height: 160,
                        ),
                        Text(
                          "Publish",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/3319/3319660.png',
                          height: 160,
                        ),
                        Text(
                          "Exam",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/1589/1589526.png',
                          height: 160,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
