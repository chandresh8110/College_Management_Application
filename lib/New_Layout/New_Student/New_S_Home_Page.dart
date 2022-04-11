import 'package:final_app/Marks/Student_Marks_view.dart';
import 'package:final_app/Material/Student_Material_View.dart';
import 'package:final_app/Notice/Notice_View_Student.dart';
import 'package:final_app/Profile/Setting_page.dart';
import 'package:flutter/material.dart';
import 'package:final_app/New_Layout/header_widget_homePages.dart';

import '../../General Side/theme_helper.dart';

class New_S_Homepage extends StatefulWidget {
  const New_S_Homepage({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<New_S_Homepage> createState() => _New_S_HomepageState();
}

class _New_S_HomepageState extends State<New_S_Homepage> {
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
                            'https://cdn-icons-png.flaticon.com/512/4207/4207247.png',
                            height: 150,
                          ),
                          Text(
                            "Material",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Student_Material_View(
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
                            'https://cdn-icons-png.flaticon.com/512/3892/3892387.png',
                            height: 150,
                          ),
                          Text(
                            "Notice",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Notice_View_Student(
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
                            'https://cdn-icons-png.flaticon.com/512/2641/2641409.png',
                            height: 150,
                          ),
                          Text(
                            "Marks",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Student_Marks_view(
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
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Profile_page(
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
