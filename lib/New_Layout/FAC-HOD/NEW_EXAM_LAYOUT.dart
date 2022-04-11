// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../../Exam/Select_Exam_Sub_First_Page.dart';
import '../../General Side/theme_helper.dart';
import '../../Marks/Add_Marks_FPG.dart';
import '../../Marks/Faculty_Marks_view_FP.dart';


class New_Exam_Layout extends StatefulWidget {
  const New_Exam_Layout({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<New_Exam_Layout> createState() => _New_Exam_LayoutState();
}

class _New_Exam_LayoutState extends State<New_Exam_Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.lightGreenAccent,
                Colors.lightBlueAccent,
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
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
                            Center(
                              child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/1081/1081025.png',
                                height: 150,
                              ),
                            ),
                            Center(
                              child: Text(
                                "Select Exam Subject",
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
                            builder: (context) => Select_Exam_Sub(
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
                              'https://cdn-icons-png.flaticon.com/512/1205/1205526.png',
                              height: 150,
                            ),
                            Text(
                              "Add Marks",
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
                                Add_Marks_FP(username: widget.username),
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
                              "View Marks",
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
                            builder: (context) => Faculty_Marks_view_FP(
                                username: widget.username),
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
      ),
    );
  }
}
