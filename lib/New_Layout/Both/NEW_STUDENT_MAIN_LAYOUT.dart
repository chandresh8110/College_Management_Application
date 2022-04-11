// ignore_for_file: camel_case_types

import 'package:final_app/Add_Data/Add_Student.dart';
import 'package:final_app/PRDE/Prde.dart';
import 'package:final_app/Search/Student_HOD_Search.dart';
import 'package:final_app/Search/Student_Search_List.dart';
import 'package:flutter/material.dart';

import '../../General Side/theme_helper.dart';
import '../../Search/Student_Faculty_Search.dart';

class New_Student_Layout extends StatefulWidget {
  const New_Student_Layout({Key? key, required this.username})
      : super(key: key);

  final String username;

  @override
  State<New_Student_Layout> createState() => _New_Student_LayoutState();
}

class _New_Student_LayoutState extends State<New_Student_Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student"),
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
                                'https://cdn-icons-png.flaticon.com/512/5065/5065148.png',
                                height: 150,
                              ),
                            ),
                            Center(
                              child: Text(
                                "ADD Student",
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
                            builder: (context) => Add_Student(),
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
                              'https://cdn-icons-png.flaticon.com/512/6082/6082867.png',
                              height: 150,
                            ),
                            Text(
                              "Edit/Delete Student",
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
                                Student_HOD_Search(username: widget.username),
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
                              'https://cdn-icons-png.flaticon.com/512/4394/4394562.png',
                              height: 150,
                            ),
                            Text(
                              "Sem Wise Student List",
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
                            builder: (context) => Student_Search_List(),
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
                              'https://cdn-icons-png.flaticon.com/512/1589/1589531.png',
                              height: 150,
                            ),
                            Text(
                              "Promotion/Demotion",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Prde(),
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
