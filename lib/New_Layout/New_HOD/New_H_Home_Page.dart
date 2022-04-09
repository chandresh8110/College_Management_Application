import 'package:final_app/New_Layout/header_widget_homePages.dart';
import 'package:flutter/material.dart';

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
              true, username: widget.username,
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
                          height: 150,
                        ),
                        Center(
                          child: Text(
                            "Student",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
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
                          'https://cdn-icons-png.flaticon.com/512/3135/3135755.png',
                          height: 150,
                        ),
                        Text(
                          "Faculty",
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
                          'https://cdn-icons-png.flaticon.com/512/3135/3135755.png',
                          height: 150,
                        ),
                        Text(
                          "Attendance",
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
                          'https://cdn-icons-png.flaticon.com/512/3135/3135755.png',
                          height: 150,
                        ),
                        Text(
                          "Course",
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
                          'https://cdn-icons-png.flaticon.com/512/3135/3135755.png',
                          height: 150,
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
                          'https://cdn-icons-png.flaticon.com/512/3135/3135755.png',
                          height: 150,
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
                          'https://cdn-icons-png.flaticon.com/512/3135/3135755.png',
                          height: 150,
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
